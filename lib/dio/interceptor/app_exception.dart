import 'package:dio/dio.dart';

class AppException implements Exception {
  int code;
  String msg;

  AppException(this.code, this.msg);

  factory AppException.create(DioException err) {
    switch (err.type) {
      case DioExceptionType.cancel:
        return AppException(-1, '取消请求');
      case DioExceptionType.connectionTimeout:
        return AppException(-1, '连接超时');
      case DioExceptionType.sendTimeout:
        return AppException(-1, '请求超时');
      case DioExceptionType.receiveTimeout:
        return AppException(-1, '响应超时');
      case DioExceptionType.badResponse:
        int errCode = err.response!.statusCode!;
        switch (errCode) {
          case 400:
            return AppException(errCode, '请求语法错误');
          case 401:
            return AppException(errCode, '没有权限');
          case 403:
            return AppException(errCode, '服务器拒绝访问');
          case 404:
            return AppException(errCode, '无法连接服务器');
          case 405:
            return AppException(errCode, '请求方法被禁止');
          case 500:
            return AppException(errCode, '服务器内部错误');
          case 502:
            return AppException(errCode, '无效请求');
          case 503:
            return AppException(errCode, '服务器挂了');
          case 505:
            return AppException(errCode, '不支持Http协议请求');
          default:
            return AppException(errCode, err.response!.statusMessage!);
        }
      default:
        return AppException(-1, err.message ?? '未知错误');
    }
  }
}
