import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_demo/dio/api.dart';

import 'model/base_model.dart';

class DioUtils {
  static final DioUtils _instance = DioUtils._internal();

  static DioUtils get instance {
    return _instance;
  }

  var dio = Dio();

  DioUtils._internal() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 5 * 1000),
      receiveTimeout: const Duration(milliseconds: 3 * 1000),
      sendTimeout: const Duration(milliseconds: 10 * 1000),
      baseUrl: Api.baseUrl,
      responseType: ResponseType.plain,
      headers: {'': '', '': ''},
    );
    dio.options = options;
    // dio.interceptors.add(LogInterceptor());
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.findProxy = (uri) {
    //     //proxy all request to localhost:8888
    //     return 'PROXY localhost:8888';
    //   };
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    // };
  }

  request() {
    // dio.request(path)
  }

  Future<BaseModel<T>> get<T>(url, {query, options, cancelToken}) async {
    options ?? Options();
    Response response = await dio.get(url,
        queryParameters: query, cancelToken: cancelToken, options: options);
    var string = response.data.toString();
    var map = json.decode(string);
    return BaseModel.fromJson(map);
  }
}

void main() async {
  var future = DioUtils.instance.get('article/list/0/json');
  print(future.toString());
}
