import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/database/database_manager.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/user_model.dart';
import 'base_entry_service.dart';

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
        var loggedInUser = await user.fromObject(response.data);
        await DbManager.instance.insertUser(loggedInUser);
        _goToHomeView();
        return 'Welcome';
      } else {
        throw ('Login not successful');
      }
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String> signUp(UserModel user) async {
    try {
      final response =
          await NetworkManager.instance.post(_authURl + '/register', user);
      if (response != null) {
        _goToHomeView();
        return 'Welcome ' + user.name + ' ' + user.surname;
      }
      throw Exception('User is not registering');
    } catch (e) {
      return e.toString();
    }
  }

  static EntryService get instance {
    _instance ??= EntryService._init();
    return _instance;
  }

  void _goToHomeView() {
    NavigationManager.instance.navigationToPage(NavigationConstant.HOME);
  }
}
