import '../../../utils/constants/constant_fields.dart';
import 'api_services/base_api_service.dart';
import 'api_services/network_api_service.dart';

class AuthAPI {
  final BaseAPIServices _apiServices = NetworkAPIServices();
  Future<dynamic> loginAPI(dynamic data) async =>
      await _apiServices.postAPIResponse(loginEndPoint, data);

  Future<dynamic> registerAPI(dynamic data) async =>
      await _apiServices.postAPIResponse(signUpEndPoint, data);
}
