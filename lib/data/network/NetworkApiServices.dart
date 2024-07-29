import 'dart:convert';
import 'dart:io';

import 'package:demo_app_provider/data/app_exeaption.dart';
import 'package:demo_app_provider/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiServicse extends BaseApiServices {
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic resJson;
    try {
      Response response = await post(Uri.parse(url), body: data);
      resJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(' No Internet Connection');
    }
    return resJson;
  }

  @override
  Future getGetApiResponse(String url) async {
    dynamic resJson;
    try {
      final res =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      resJson = returnResponse(res);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return resJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic resJson = jsonDecode(response.body);
        return resJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnaThorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
