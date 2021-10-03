import 'dart:io';

import '../../constants/navigation/navigation_constant.dart';
import '../navigation/navigation_manager.dart';

import '../../base/model/base_model.dart';
import 'base_dio_service.dart';

class NetworkManager extends ICoreDio {
  static NetworkManager _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  NetworkManager._init();
  @override
  Future<dynamic> fetch<T extends BaseModel>(String path, {T model}) async {
    try {
      final response = await dio.get(path);
      switch (response.statusCode) {
        case HttpStatus.ok:
          final responseBody = response.data;
          if (model == null) {
            return responseBody;
          } else if (responseBody is List) {
            return responseBody
                .map((e) => model.fromObject(e))
                .cast<T>()
                .toList();
          } else if (responseBody is Map) {
            return model.fromObject(responseBody);
          } else {
            return responseBody;
          }
          break;
        default:
          _goToErrorView();
          break;
      }
    } catch (e) {
      _goToErrorView();
    }
    return null;
  }

  @override
  Future<dynamic> post<T extends BaseModel>(String path, T model) async {
    try {
      final response = await dio.post(path, data: model.toMap());
      if (response == null) {
        _goToErrorView();
      }
      return model.fromObject(response.data);
    } catch (e) {
      _goToErrorView();
    }
  }

  void _goToErrorView() =>
      NavigationManager.instance.navigationToPage(NavigationConstant.ERROR);
}
