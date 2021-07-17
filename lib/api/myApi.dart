import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class MyApi {
  final Dio _dio = Dio();

  register({
    @required String username,
    @required String email,
    @required String password,
  }) async {
    try {
      final Response response = await this._dio.post(
        'http://192.168.101.9:8000/api/registro/',
        data: {
          "username": username,
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
  }
}
