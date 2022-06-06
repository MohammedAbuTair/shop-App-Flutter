import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        // baseUrl: 'http://dev70.hoja-crm.com/API/data.php?type=userLogin&email=hamzahshajrawi@gmail.com&password=admin123',
        // baseUrl: 'http://dev70.hoja-crm.com/API/data.php',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = "en",
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': "application/json",
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio?.get(url, queryParameters: query);
  }

  static Future<Response?> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = "en",
    String? token,
  }) async {
    Response? userData;
    dio?.options.headers = {
      'Content-Type': "application/json",
      'lang': lang,
      'Authorization': token ?? '',
    };
    try {
      userData = await dio?.post(
        url,
        queryParameters: query,
        data: data,
      );
      return userData;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }
}
