import '../../../view/authentication/entry/model/user_model.dart';
import '../../base/model/base_model.dart';

abstract class IDbManager {
  Future<int> deleteUser(String id);

  Future<UserModel> fetchUser<T extends BaseModel>(T model);

  Future<int> insertUser(UserModel model);

  Future<int> updateUser(UserModel model);
}
