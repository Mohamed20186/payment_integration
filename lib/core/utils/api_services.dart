import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();
  Future<Response> post(
      {required body,
      required String token,
      required String url,
      String? contentType}) async {
    var response = dio.post(url,
        data: body,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Authorization': "Bearer $token "},
        ));
    return response;
  }
}
