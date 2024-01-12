import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/data/model/user.dart';
import 'package:flutter_api_mvvm/data/repositories/auth_repository.dart';
import 'package:flutter_api_mvvm/utils/showing_info/toast_message.dart';
import 'package:flutter_api_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/constants/constant_fields.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepository = AuthRepository();
  bool isLoading = false;
  void setLoading(bool load) {
    isLoading = load;
    notifyListeners();
  }

  Future<void> login(
      {required dynamic data, required BuildContext context}) async {
    try {
      setLoading(true);
      final value = await _authRepository.login(data);
      setLoading(false);
      flushBarErrorMessage('Login Successfully', context);
      final userViewModel = Provider.of<UserViewModel>(context, listen: false);
      userViewModel.saveUser(
        User(
          id: null,
          token: value[SharedPreferencesForUser.token.name],
        ),
      );
      Navigator.of(context).pushNamed(kHomeScreen);
    } catch (e) {
      setLoading(false);
      flushBarErrorMessage(e.toString(), context);
    }
  }

  Future<void> signUp(
      {required dynamic data, required BuildContext context}) async {
    try {
      setLoading(true);
      await _authRepository.register(data);
      setLoading(false);
      flushBarErrorMessage('Register Successfully', context);
      Navigator.of(context).pushNamed(kHomeScreen);
    } catch (e) {
      setLoading(false);
      flushBarErrorMessage(e.toString(), context);
    }
  }
}
