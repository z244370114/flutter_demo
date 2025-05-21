import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_demo/dio/interceptor/app_exception.dart';

class RequestInterceptor extends Interceptor {
  // Future<bool> isConnected() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   return connectivityResult != ConnectivityResult.none;
  // }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {}

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {}

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // if (err.type == DioErrorType.other) {
    //   bool isConnectNetWork = await isConnected();
    //   if (!isConnectNetWork && err.error is MyDioSocketException) {
    //     err.error.message = "当前网络不可用，请检查您的网络";
    //   }
    // }
    AppException appException = AppException.create(err);
    // err.error = appException;
    return super.onError(err, handler);
  }
}
