import 'package:fresh_dio/fresh_dio.dart';
import 'package:injectable/injectable.dart';

import 'package:test_proj/services/http/http_client.dart';
import 'models/models.dart';

@Injectable(scope: 'auth')
class AuthRepository {
  final HttpClient httpClient;

  AuthRepository(this.httpClient);

  Stream<AuthenticationStatus> get authenticationStatus =>
      httpClient.authenticationStatus;

  Future<void> signIn(String userName, String password) async {
    final response = await httpClient.post(
      '/auth/login',
      data: {
        'username': 'mor_2314',
        'password': '83r5^_',
      },
    );

    return httpClient.setToken(response.data['token'] as String);
  }

  Future<void> signOut() {
    return httpClient.clearToken();
  }

  Future<UserProfile> getUserProfile() async {
    return UserProfile.fromJson({'userName': 'test'});
  }
}
