import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  var logger = Logger();
  late DateTime startTime;
  late DateTime endTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    startTime = DateTime.now();
    logger.i(
        '---------- Request Start ---------- ${startTime.millisecondsSinceEpoch}');
    var url = options.baseUrl + options.path;
    if (options.queryParameters.isNotEmpty) {
      logger.i(
          'RequestUrl: $url?${Transformer.urlEncodeMap(options.queryParameters)}');
    } else {
      logger.i('RequestUrl: $url');
    }

    logger.i('RequestMethod: ${options.method}');
    logger.i('RequestHeaders: ${options.headers.toString()}');
    logger.i('RequestContentType: ${options.contentType}');
    logger.i('RequestData: ${options.data.toString()}');
    logger.i('---------- Request End ----------');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {}

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    RequestOptions options = response.requestOptions;
    logger.i('---------- Response Start ----------');
    logger.i('ResponseUrl: ' +
        options.baseUrl +
        options.path +
        '?' +
        Transformer.urlEncodeMap(options.queryParameters));
    endTime = DateTime.now();
    int duration = endTime.difference(startTime).inMilliseconds;
    if (response.statusCode == 200) {
      logger.i('ResponseCode: ${response.statusCode}');
    } else {
      logger.e('ResponseCode: ${response.statusCode}');
    }
    logger.i(response.data.toString());
    logger.i('---------- Response End: $duration 毫秒----------');
    super.onResponse(response, handler);
  }
}

