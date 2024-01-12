import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/data/model/user.dart';
import 'package:flutter_api_mvvm/view_model/user_view_model.dart';

import '../../utils/constants/constant_fields.dart';

class SplashServices {
  Future<User?> get userData => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async {
    try {
      User? user = await userData;
      if (user?.token == null) {
        await Future.delayed(
          const Duration(seconds: 5),
        );
        Navigator.of(context).pushNamed(kLoginScreen);
      } else {
        await Future.delayed(
          const Duration(seconds: 5),
        );
        Navigator.of(context).pushNamed(kHomeScreen);
      }
    } catch (e) {
      print('Error Here = $e');
    }
  }
}
