import 'dart:io';

import 'package:food_delivery/core/base/model/base_model.dart';
import 'package:food_delivery/core/init/network/base_dio_service.dart';

class NetworkManager extends ICoreDio {
  static NetworkManager _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  NetworkManager._init();
  @override
  Future<List<BaseModel>> fetch<T extends BaseModel>(
      String path, T model) async {
    try {
      final response = await dio.get(path);
      switch (response.statusCode) {
        case HttpStatus.ok:
          final responseBody = response.data;
          if (responseBody is List)
            return responseBody
                .map((e) => model.fromObject(e))
                .cast<T>()
                .toList();
          else if (responseBody is Map)
            return model.fromObject(responseBody);
          else
            return responseBody;
          break;
        default:
          // TODO: 
          break;
      }
    } catch (e) {
      // TODO error
    }
    return null;
  }

  @override
  Future<dynamic> post<T extends BaseModel>(String path, T model) async {
    try {
      final response = await dio.post(path, data: model.toMap());
      if (response == null) {
        // TODO error
      }
      return response;
    } catch (e) {
      // TODO error
    }
  }
}