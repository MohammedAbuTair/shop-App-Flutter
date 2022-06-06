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
        headers: {"Content-Type": "application/json"},
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    required Map<String, dynamic>? query,
    String lang = "ar",
    String? token,
  }) async {
    dio?.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await dio?.get(url, queryParameters: query);
  }

  static Future<Response?> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = "ar",
    String? token,
  }) async {
    Response? userData;
    dio?.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    try {
      userData = await dio?.post(
        url,
        queryParameters: query,
        data: data,
      );
      print(url);
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

    // return await dio?.post(
    //   url,
    //   queryParameters: query,
    //   data: data,
    // );
  }

  // Future<Response?> postData2(String url) async {
  //   Response response;
  //   try {

  //     response = await dio!.post(url);

  //     return response;
  //   } on DioError catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return error.response;
  //   }
  // }
}
