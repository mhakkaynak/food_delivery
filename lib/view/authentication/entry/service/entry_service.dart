import 'package:food_delivery/core/init/database/database_manager.dart';
import 'package:food_delivery/core/init/network/network_manager.dart';
import 'package:food_delivery/view/authentication/entry/model/user_model.dart';
import 'package:food_delivery/view/authentication/entry/service/base_entry_service.dart';

class EntryService extends IEntryService {
  EntryService._init();

  static EntryService _instance;

  final _authURl = '/authentication';

  @override
  Future<String> login(UserModel user) async {
    try {
      final response =
          await NetworkManager.instance.post(_authURl + '/login', user);
      if (response != null) {
        UserModel loggedInUser = await user.fromObject(response.data);
        final result = DbManager().insert(loggedInUser);
        print('result:' + result.toString());
        // TODO fetch ile kontrol et
        // TODO db de kayit islemini yap
      }
    } catch (e) {
      return e.toString();
    }
  }

  // TODO registerdan sonra loginpost ve login get yapicaksin db icin de bi constractor olustur

  @override
  Future<String> signUp(UserModel user) async {
    try {
      final response =
          await NetworkManager.instance.post(_authURl + '/register', user);
      if (response != null) return 'Welcome ' + user.name + ' ' + user.surname;
      throw Exception('User is not registering');
    } catch (e) {
      return e.toString();
    }
  }

  static EntryService get instance {
    _instance ??= EntryService._init();
    return _instance;
  }
}
