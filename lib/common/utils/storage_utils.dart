import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class StorageUtils {
  SharedPreferences? storage;

  Future<void> writeUserInfo(
      {required String key, required dynamic userInfo}) async {
    storage = await SharedPreferences.getInstance();

    await storage?.setString(key, userInfo.toString());
  }

  Future<void> logoutUser() async {
    storage = await SharedPreferences.getInstance();
    await storage?.clear();
  }

  Future<bool> hasSeenIntroSlides() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('seenIntroSlides') ?? false;
  }

  Future<void> markIntroSlidesAsSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenIntroSlides', true);
  }

  @preResolve
  Future<String?> getUserInfo({required String? key}) async {
    storage = await SharedPreferences.getInstance();
    String? userinfo;
    if (key != null) {
      userinfo = storage?.getString(key);
    }

    return userinfo;
  }
}
