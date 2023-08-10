import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/mainView/mainview.dart';
import 'package:medicalapp2/presention/newpassword/new_password.dart';
import 'package:medicalapp2/presention/verifaction/VarifictionView.dart';
import '../forgot_password/forget_password_view.dart';
import '../login/login_view.dart';
import '../mainView/new chat/newchat.dart';
import '../register/register_view.dart';
import '../spalsh/splash_view.dart';
import 'string_manger.dart';

class Routes {
  static const String splashScreen = "/";
  static const String regestarRoutes = "/regestar";
  static const String loginRoutes = "/login";
  static const String forgotPasswordRoutes = "/forgotPassword";
  static const String mainRoutes = "/main";
  static const String onbordingRoutes = "/onbording";
  static const String storeDetailsRoutes = "/storeDetails";
  static const String VerfictionRoute = "/verfiction";
  static const String NewPassword = "/newpassword";
  static const String NewChat = "/newchat";
  static const String OldChat = "/oldchat";
}

class GeneretorRoutes {
 static TextEditingController x =TextEditingController();
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashView());

      case Routes.regestarRoutes:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.loginRoutes:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.forgotPasswordRoutes:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
        case Routes.VerfictionRoute:
        return MaterialPageRoute(builder: (_) => Verfiction());
     case Routes.mainRoutes:
        return MaterialPageRoute(builder: (_) => MainView());
        case Routes.NewPassword:
        return MaterialPageRoute(builder: (_) => NewPasswordView());
      case Routes.NewChat:
        return MaterialPageRoute(builder: (_) => NewChat());



      default:
        return UnDefiandRoutes();
    }
  }

  static Route<dynamic> UnDefiandRoutes() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(StringManger.noRouteFound),
        ),
      ),
    );
  }
}
