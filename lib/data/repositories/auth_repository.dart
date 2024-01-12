import 'package:flutter_api_mvvm/data/network/apis/auth_api.dart';

class AuthRepository {
  final AuthAPI _authAPI = AuthAPI();
  Future<dynamic> login(dynamic data) async => await _authAPI.loginAPI(data);

  Future<dynamic> register(dynamic data) async =>
      await _authAPI.registerAPI(data);
}
