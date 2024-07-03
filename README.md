# 项目

Flutter App 开发脚手架.

## 介绍

这是一个简单的Flutter App开发模板，包含了简单的路由。

## 初始化项目

```shell
flutter create --project-name zhyx --org com.oldwei .
```

### hive

在`pubspec.yaml`文件中添加依赖

hive: ^2.2.3
path_provider: ^2.1.3

添加开发依赖

build_runner: ^2.4.10
hive_generator: ^2.0.1

```shell
flutter packages pub run build_runner build
# Deprecated. Use `dart run` instead.
dart run build_runner build
```