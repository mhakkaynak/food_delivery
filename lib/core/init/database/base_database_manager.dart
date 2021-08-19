import '../../../view/authentication/entry/model/user_model.dart';
import '../../base/model/base_model.dart';

abstract class IDbManager {
  Future<int> delete(String id);

  Future<UserModel> fetch<T extends BaseModel>(T model);

  Future<int> insert(UserModel model);

  Future<int> update(UserModel model);
}
