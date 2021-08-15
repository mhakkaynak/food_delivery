import 'package:food_delivery/view/authentication/entry/model/user_model.dart';

abstract class IEntryService {
  Future<String> signUp(UserModel user);
  Future<String> login(UserModel user);
}
