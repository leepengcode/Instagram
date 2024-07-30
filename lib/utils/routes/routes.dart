import 'package:demo_app_provider/utils/routes/routes_name.dart';
import 'package:demo_app_provider/view/home_screen.dart';
import 'package:demo_app_provider/view/login_screen.dart';
import 'package:demo_app_provider/view/signup_screen.dart';
import 'package:demo_app_provider/view/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argume = settings.arguments;
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignupScreen());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              body: Center(
            child: Text("No route found"),
          ));
        });
    }
  }
}
