class Pagination {
  int? pageIndex;
  int? pageSize;
  int? totalCount;
  int? totalPages;
  bool? hasPreviousPage;
  bool? hasNextPage;
  List<BarcodeProduct>? items;

  Pagination({
    this.pageIndex,
    this.pageSize,
    this.totalCount,
    this.totalPages,
    this.hasPreviousPage,
    this.hasNextPage,
    this.items,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      pageIndex: json['PageIndex'],
      pageSize: json['PageSize'],
      totalCount: json['TotalCount'],
      totalPages: json['TotalPages'],
      hasPreviousPage: json['HasPreviousPage'],
      hasNextPage: json['HasNextPage'],
      items: json['Items'] != null
          ? (json['Items'] as List)
              .map((item) => BarcodeProduct.fromJson(item))
              .toList()
          : null,
    );
  }
}

class BarcodeProduct {
  String? keyword;
  String? branchCode;
  String? gtin;
  String? fId;
  String? specification;
  String? brandid;
  String? baseId;
  bool? isPrivate;
  String? firmName;
  String? brandcn;
  String? pictureFilename;
  String? description;
  String? logoutFlag;
  int? haveMsProduct;
  DateTime? baseCreateTime;
  String? branchName;
  String? baseSource;
  String? gpc;
  String? gpcname;
  DateTime? saledate;
  int? saledateyear;
  DateTime? baseLastUpdated;
  String? baseUserId;
  String? code;
  String? levels;
  String? levelsSource;
  DateTime? validDate;
  String? logoutDate;
  int? gtinstatus;
  String? regulatedProductName;

  BarcodeProduct({
    this.keyword,
    this.branchCode,
    this.gtin,
    this.fId,
    this.specification,
    this.brandid,
    this.baseId,
    this.isPrivate,
    this.firmName,
    this.brandcn,
    this.pictureFilename,
    this.description,
    this.logoutFlag,
    this.haveMsProduct,
    this.baseCreateTime,
    this.branchName,
    this.baseSource,
    this.gpc,
    this.gpcname,
    this.saledate,
    this.saledateyear,
    this.baseLastUpdated,
    this.baseUserId,
    this.code,
    this.levels,
    this.levelsSource,
    this.validDate,
    this.logoutDate,
    this.gtinstatus,
    this.regulatedProductName,
  });

  factory BarcodeProduct.fromJson(Map<String, dynamic> json) {
    return BarcodeProduct(
      keyword: json['keyword'],
      branchCode: json['branch_code'],
      gtin: json['gtin'],
      fId: json['f_id'],
      specification: json['specification'],
      brandid: json['brandid'],
      baseId: json['base_id'],
      isPrivate: json['is_private'],
      firmName: json['firm_name'],
      brandcn: json['brandcn'],
      pictureFilename: json['picture_filename'],
      description: json['description'],
      logoutFlag: json['logout_flag'],
      haveMsProduct: json['have_ms_product'],
      baseCreateTime: json['base_create_time'] != null
          ? DateTime.parse(json['base_create_time'])
          : null,
      branchName: json['branch_name'],
      baseSource: json['base_source'],
      gpc: json['gpc'],
      gpcname: json['gpcname'],
      saledate: DateTime.parse(json['saledate']),
      saledateyear: json['saledateyear'],
      baseLastUpdated: json['base_last_updated'] != null
          ? DateTime.parse(json['base_last_updated'])
          : null,
      baseUserId: json['base_user_id'],
      code: json['code'],
      levels: json['levels'],
      levelsSource: json['levels_source'],
      validDate: json['valid_date'] != null
          ? DateTime.parse(json['valid_date'])
          : null,
      logoutDate: json['logout_date'],
      gtinstatus: json['gtinstatus'],
      regulatedProductName: json['RegulatedProductName'],
    );
  }
}
