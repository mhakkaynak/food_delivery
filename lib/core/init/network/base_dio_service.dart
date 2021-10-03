import 'dart:io';

import 'package:dio/dio.dart';

import '../../base/model/base_model.dart';

abstract class ICoreDio {
  Dio dio;

  ICoreDio() {
    var baseUrl = Platform.isIOS
        ? 'http://localhost:4004'
        : 'http://192.168.1.39:4004';
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<dynamic> fetch<T extends BaseModel>(String path, {T model});

  Future<dynamic> post<T extends BaseModel>(String path, T model);

}
