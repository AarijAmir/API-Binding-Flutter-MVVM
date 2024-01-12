import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/utils/constants/constant_fields.dart';
import 'package:flutter_api_mvvm/view/home_view.dart';
import 'package:flutter_api_mvvm/view/login_view.dart';
import 'package:flutter_api_mvvm/view/sign_up_view.dart';
import 'package:flutter_api_mvvm/view/splash_view.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kHomeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case kLoginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case kSignUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
        );
      case kSplashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      default:
        throw 'No Route Found';
    }
  }
}
