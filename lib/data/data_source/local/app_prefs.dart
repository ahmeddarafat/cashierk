import 'package:shared_preferences/shared_preferences.dart';

class PrefsKeys {
  PrefsKeys._();

  static const String onboarding = "onboarding";
  static const String login = "login";
  static const String token = "token";
  static const String userInfo = "user info";
}

class AppPrefs {
  final SharedPreferences _sharedPrefs;
  AppPrefs(this._sharedPrefs);

  /// onboarding
  Future<void> setOnBoardingViewed() async {
    await _sharedPrefs.setBool(PrefsKeys.onboarding, true);
  }

  bool isOnBoardingViewed() {
    return _sharedPrefs.getBool(PrefsKeys.onboarding) ?? false;
  }

  /// Auth
  Future<void> setUserLoggedIn() async {
    await _sharedPrefs.setBool(PrefsKeys.login, true);
  }

  bool isUserLoggedIn() {
    return _sharedPrefs.getBool(PrefsKeys.login) ?? false;
  }

  Future<void> logout() async {
    await _sharedPrefs.remove(PrefsKeys.login);
  }

  /// token
  Future<void> setToken(String token) async {
    await _sharedPrefs.setString(PrefsKeys.token, token);
  }

  String getToken() {
    return _sharedPrefs.getString(PrefsKeys.token) ?? "Unknown";
  }

  Future<void> removeToken() async {
    await _sharedPrefs.remove(PrefsKeys.token);
  }

  /// userInfo
  Future<void> setUserInfo({
    required String name,
    required String email,
    required String phone,
  }) async {
    await _sharedPrefs.setStringList(
      PrefsKeys.userInfo,
      [
        name,
        email,
        phone,
      ],
    );
  }

  ({ String email, String name, String phone}) getUserInfo() {
    final userInfo = _sharedPrefs.getStringList(PrefsKeys.userInfo);
    return (
      name: userInfo?[0] ?? "Unknown",
      email: userInfo?[1] ?? "Unknown",
      phone: userInfo?[2] ?? "Unknown",
    );
  }

  void removeUserInfo() {
    _sharedPrefs.remove(PrefsKeys.userInfo);
  }

  void clear() {
    _sharedPrefs.clear();
  }
}
