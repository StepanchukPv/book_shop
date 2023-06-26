import 'package:http/http.dart' as http;
import 'package:landlord/base/network/request.dart';
import 'package:landlord/base/network/response.dart';

class Network {
  final _client = http.Client();

  final String baseUrl;

  Network({required this.baseUrl});

  Future<T> performRequest<T>(Request<T> _request) async {
    late Response response;

    try {
      final baseReqeust = _request.toBaseRequest(baseUrl);
      final baseResponse = await _client.send(baseReqeust);
      response = await baseResponse.toResponse();
    } on Exception catch (e) {
      //TODO: avoid print + handle excaption
      rethrow;
    }

    if (response.statusCode >= 300 || response.statusCode < 200) {
      //TODO: implement exception
      throw Exception();
    }

    return _request.parseJsonResponse(response);
  }
}
