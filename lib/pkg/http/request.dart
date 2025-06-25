import 'dart:convert';
import 'dart:io';

import 'package:app/pkg/constants/request.dart';
import 'package:app/pkg/routers/routes.dart';
import 'package:app/pkg/utils/logger.dart';
import 'package:app/pkg/utils/sp.dart';
import 'package:app/pkg/utils/toast.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  late Dio _dio;
  CancelToken cancelToken = CancelToken();

  ApiService._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      // 请求基地址,可以包含子路径
      baseUrl: HttpConfig.serverApiUrl,

      // baseUrl: storage.read(key: STORAGE_KEY_APIURL) ?? SERVICE_API_BASEURL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: const Duration(seconds: 10),

      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: const Duration(seconds: 5),

      // Http请求头.
      headers: {},

      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
      /// 就会自动编码请求体.
      contentType: 'application/json; charset=utf-8',

      /// [responseType] 表示期望以那种格式(方式)接受响应数据。
      /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
      ///
      /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，request 会自动将响应内容转化为json对象。
      /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
      ///
      /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
      responseType: ResponseType.json,
    );

    _dio = Dio(options);

    // Cookie管理
    if (kIsWeb) {
      logger.i("Web 环境下不能使用 dio_cookie_manager");
    } else {
      CookieJar cookieJar = CookieJar();
      _dio.interceptors.add(CookieManager(cookieJar));
    }

    // 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Do something before request is sent
        return handler.next(options); //continue
        // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response); // continue
        // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onError: (DioException e, handler) {
        // Do something with response error
        // Loading.dismiss();
        ErrorEntity eInfo = createErrorEntity(e);
        onError(eInfo);
        return handler.next(e); //continue
        // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      },
    ));
  }

  /*
   * error统一处理
   */

  // 错误处理
  void onError(ErrorEntity eInfo) async {
    logger.i('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');
    switch (eInfo.code) {
      case 401:
        SPUtils.clear();
        getx.Get.toNamed(AppRoutes.dashboard);
        break;
      default:
        break;
    }
  }

  // 错误信息
  ErrorEntity createErrorEntity(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return ErrorEntity(code: -1, message: "请求取消");
      case DioExceptionType.connectionTimeout:
        return ErrorEntity(code: -1, message: "连接超时");
      case DioExceptionType.sendTimeout:
        return ErrorEntity(code: -1, message: "请求超时");
      case DioExceptionType.receiveTimeout:
        return ErrorEntity(code: -1, message: "响应超时");
      case DioExceptionType.badResponse:
        {
          try {
            int errCode =
                error.response != null ? error.response!.statusCode! : -1;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case 400:
                return ErrorEntity(code: errCode, message: "请求语法错误");
              case 401:
                return ErrorEntity(code: errCode, message: "没有权限");
              case 403:
                return ErrorEntity(code: errCode, message: "服务器拒绝执行");
              case 404:
                return ErrorEntity(code: errCode, message: "无法连接服务器");
              case 405:
                return ErrorEntity(code: errCode, message: "请求方法被禁止");
              case 500:
                return ErrorEntity(code: errCode, message: "服务器内部错误");
              case 502:
                return ErrorEntity(code: errCode, message: "无效的请求");
              case 503:
                return ErrorEntity(code: errCode, message: "服务器挂了");
              case 505:
                return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
              default:
                {
                  // return ErrorEntity(code: errCode, message: "未知错误");
                  return ErrorEntity(
                    code: errCode,
                    message: error.response != null
                        ? error.response!.statusMessage!
                        : "",
                  );
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误");
          }
        }
      default:
        {
          return ErrorEntity(code: -1, message: error.message!);
        }
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  /// 读取本地配置
  Future<Map<String, dynamic>> getAuthorizationHeader() async {
    var headers = <String, dynamic>{};
    String? token = SPUtils.getString('AppAuthToken');
    if (token != null && token != "") {
      headers['X-Token'] = token;
    }
    return headers;
  }

  /// restful get 操作
  /// refresh 是否下拉刷新 默认 false
  /// noCache 是否不缓存 默认 true
  /// list 是否列表 默认 false
  /// cacheKey 缓存key
  /// cacheDisk 是否磁盘缓存
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool noCache = HttpConfig.cacheEnable,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= <String, dynamic>{};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "noCache": noCache,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic> authorization = await getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);

    var response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post 操作
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic> authorization = await getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);
    var response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful put 操作
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic> authorization = await getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);
    var response = await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful patch 操作
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic> authorization = await getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);
    var response = await _dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful delete 操作
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic> authorization = await getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);
    var response = await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post form 表单提交操作
  Future postForm(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic> authorization = await getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);
    var response = await _dio.post(
      path,
      data: FormData.fromMap(data),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  Future getDownload(
    String urlPath,
    dynamic savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  }) async {
    var response = await _dio.download(
      urlPath,
      savePath,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      deleteOnError: deleteOnError,
      lengthHeader: lengthHeader,
      data: data,
      options: options,
    );
    return response;
  }

  Future<void> postStream(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancel,
    required void Function(dynamic) onData,
    void Function(dynamic)? onError,
    void Function()? onDone,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic> authorization = await getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);

    requestOptions
      ..responseType = ResponseType.stream
      ..headers!['Accept'] = 'text/event-stream';

    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancel,
      );

      final stream = utf8.decoder.bind(response.data.stream); // ✅ 修复这里
      String buffer = '';

      stream.listen(
        (chunk) {
          buffer += chunk;

          while (buffer.contains('\n\n')) {
            final splitIndex = buffer.indexOf('\n\n');
            final rawEvent = buffer.substring(0, splitIndex);
            buffer = buffer.substring(splitIndex + 2);

            if (rawEvent.startsWith('data:')) {
              final dataLines = rawEvent
                  .split('\n')
                  .where((line) => line.startsWith('data:'))
                  .map((line) => line.substring(5).trim())
                  .join('\n');

              try {
                final decodedData = jsonDecode(dataLines);
                onData(decodedData);
              } catch (e) {
                logger.i("数据解析错误\n$dataLines");
                toastInfo(msg: "数据解析错误");
              }
            }
          }
        },
        onError: onError,
        onDone: onDone,
      );
    } catch (e) {
      if (cancel?.isCancelled == true) {
        onError?.call('请求已被取消');
      } else {
        onError?.call(e);
        rethrow;
      }
    }
  }

  /// 提交文字和文件列表的通用方法
  Future postWithFiles(
    // API 地址
    String url, {
    required dynamic data, // 文字字段
    required List<File> files, // 文件列表
  }) async {
    // 构建 FormData
    final formData = FormData.fromMap(data);
    // final formData = FormData.fromMap({
    //   "files": [
    //     for (var file in files)
    //       await MultipartFile.fromFile(file.path,
    //           filename: file.path.split('/').last)
    //   ],
    // });

    // var images = [
    //   for (var file in files)
    //     await MultipartFile.fromFile(file.path,
    //         filename: file.path.split('/').last)
    // ];
    // 添加文件列表
    // for (var file in files) {
    //   formData.files.add(
    //     MapEntry(
    //       "images",
    //       await MultipartFile.fromFile(
    //         file.path,
    //         filename: file.path.split('/').last,
    //       ),
    //     ),
    //   );
    // }

    // 提交数据
    final response = await _dio.post(url, data: formData);

    // 打印响应
    print("上传成功: ${response.data}");
    return response.data;
  }
}

// 异常处理
class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}
