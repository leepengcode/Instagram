import 'package:demo_app_provider/data/network/BaseApiServices.dart';
import 'package:demo_app_provider/data/network/NetworkApiServices.dart';
import 'package:demo_app_provider/res/component/auth_url.dart';

class Authrepository {
  BaseApiServices _apiServices = NetworkApiServicse();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
