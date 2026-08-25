import 'package:dio/dio.dart';
import 'package:e_commerce/core/exceptions/app_exception.dart';

class DioInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('DIO ERROR TYPE: ${err.type}');
    print('DIO ERROR MESSAGE: ${err.message}');
    print('DIO RESPONSE: ${err.response?.data}');
    print('DIO STATUS CODE: ${err.response?.statusCode}');
    AppException exception;

    final responseData = err.response?.data;
    String message = 'something went wrong';

    if (responseData is Map) {
      message =
          (responseData['errors']?['msg'] as String?) ??
          (responseData['message'] as String?) ??
          message;
    }

    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout) {
      exception = NetworkException(message: 'No Internet connection');
    } else if (err.response?.statusCode != null) {
      exception = ServerException(
        message: message,
        statusCode: err.response?.statusCode,
      );
    } else {
      exception = UnexpectedException(message: message);
    }
    handler.reject(
      DioException(requestOptions: err.requestOptions, error: exception),
    );
  }
}
