import 'package:dio/dio.dart';

class Network {
  static Future<dynamic> getApi(String url) async {
    try {
      Response restGet = await Dio().get(url);
      return restGet.data;
    } on DioError catch (e) {
      var error = Map<String, dynamic>();
      error['code'] = e.response.statusCode ?? 0;
      error['message'] = e.response.statusMessage ?? 'Error';
      return error;
    }
  }
}
