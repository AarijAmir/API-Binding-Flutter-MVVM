import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants/constant_fields.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(User user) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(
      SharedPreferencesForUser.token.name,
      user.token.toString(),
    );

    notifyListeners();
    return true;
  }

  Future<User?> getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? token =
        sharedPreferences.getString(SharedPreferencesForUser.token.name);
    return (token == null) ? null : User(id: null, token: token);
  }

  Future<bool> removeUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove(SharedPreferencesForUser.token.name);

    return true;
  }
}
