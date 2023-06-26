import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:sentry_presentation/services/message_service.dart';

class HttpInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    const defaultErrorMessage = 'Something went wrong';
    MessageService.error(defaultErrorMessage);

    Sentry.captureException(err);

    super.onError(err, handler);
  }
}
