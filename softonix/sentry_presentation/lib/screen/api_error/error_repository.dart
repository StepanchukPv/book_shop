import 'package:sentry_presentation/services/http/http_client.dart';

class ErrorRepository {
  ErrorRepository({
    required this.httpClient,
  });

  final HttpClient httpClient;

  Future<void> getMe() {
    return httpClient.get('/v1/me');
  }
}
