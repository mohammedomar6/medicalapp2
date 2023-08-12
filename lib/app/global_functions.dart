import 'package:shared_preferences/shared_preferences.dart';

class GlobalFunctions {
  Future<String?> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('accessToken');
    return token;
  }

  Future<bool> isAuth() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('accessToken') != null ? true : false;
  }

  Future<void> setUserInfo({
    required dynamic user,
    String? accessToken,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('userInfo', user.toJson());
    if (accessToken != null) sp.setString('accessToken', accessToken);
  }

  // Future<UserModel> getUserInfo() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   return UserModel.fromJson(sp.getString('userInfo')!);
  // }

  Future<void> removeUserInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('userInfo');
    sp.remove('accessToken');
  }

  // Future<User> getUserInfo() async {
  //   SharedPreferences _sp = await SharedPreferences.getInstance();
  //   User userInfo = User.fromJson(_sp.getString('USERINFO')!);
  //   return userInfo;
  // }

  // logOut(BuildContext context) async {
  //   BotToast.showCustomLoading(toastBuilder: (_) {
  //     return getLoading(context: context);
  //   });
  //   SharedPreferences _sp = await SharedPreferences.getInstance();
  //   _sp.remove('TOKEN');
  //   _sp.remove('USERINFO');

  //   BotToast.closeAllLoading();
  //   // RestartWidget.restartApp(context);
  //   exit(0);
  // }
}
