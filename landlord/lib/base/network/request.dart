import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:landlord/base/network/response.dart';

enum NetworkMethod { get, post, put, delete, patch }

abstract class Request<T> {
  final NetworkMethod networkMethod;
  final String path;
  final Map<String, dynamic> parameters;
  final Map<String, String> headers;
  final Map<String, dynamic> body;

  Request(
    this.networkMethod, {
    required this.path,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  })  : parameters = parameters != null ? Map.from(parameters) : {},
        headers = headers != null ? Map.from(headers) : {},
        body = body != null ? Map.from(body) : {};

  dynamic parseJsonResponse(Response response) {
    return json.decode(response.body);
  }

  http.Request toBaseRequest(String baseUrl) {
    String mapNetworkMethod(NetworkMethod networkMethod) {
      switch (networkMethod) {
        case NetworkMethod.get:
          return 'GET';
        case NetworkMethod.post:
          return 'POST';
        case NetworkMethod.put:
          return 'PUT';
        case NetworkMethod.delete:
          return 'DELETE';
        case NetworkMethod.patch:
          return 'PATCH';
      }
    }

    final uri = Uri.https(baseUrl.replaceAll('https//:', ''), path, parameters);
    final request = http.Request(mapNetworkMethod(networkMethod), uri);
    request.headers.addAll(headers);
    request.body = json.encode(body);

    return request;
  }
}
