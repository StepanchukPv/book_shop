import 'package:http/http.dart' as http;

class Response {
  final int statusCode;
  final Map<String, String> headers;
  final int contentLenght;
  final String body;

  const Response(this.statusCode, this.headers, this.contentLenght, this.body);
}

extension ResponseExt on http.StreamedResponse {
  Future<Response> toResponse() async {
    final httpResponse = await http.Response.fromStream(this);
    return Response(
      httpResponse.statusCode,
      httpResponse.headers,
      httpResponse.contentLength ?? 0,
      httpResponse.body,
    );
  }
}
