// import 'package:biken/models/usersModel.dart';
// import 'package:dio/dio.dart';

// class MyApi {
//   final Dio _dio = Dio();
//   final String _url = 'http://192.168.101.9:8000/api/registro/';

//   Future<Users> UserList() async {
//     try {
//       Response response = await _dio.get(_url);
//       return Users.fromJson(response.data);
//     } catch (error, stacktrace) {
//       print("Exception occured: $error stackTrace: $stacktrace");
//       return Users.error("Ocurrio un error");
//     }
//   }
// }

// class MyApi {
//   final Dio _dio = Dio();

//   register() async {
//     final Response response =
//         await _dio.get("http://10.0.2.2:8000/api/registro/");
//     print(
//       response.data.toString(),
//     );
//   }
// }
// try {
//   final Response response = await this._dio.get(
//         'http://10.0.2.2:8000/api/registro/',
//       );
//   if (response.statusCode == 200) {
//     print(response.data);
//   }
// } catch (e) {
//   if (e == DioError) {
//     print(e.statusCode);
//     print(e.data);
//   }
//   print(e);
// }

import 'package:dio/dio.dart';


class MyApi {
  final Dio _dio = Dio();

  register(
      //   {
      //   @required String username,
      //   @required String email,
      //   @required String password,
      // }
      ) async {
    try {
      final Response response = await this._dio.get(
            'http://192.168.101.9:8000/api/bicicletas/',
            // data: {
            //   "username": username,
            //   "email": email,
            //   "password": password,
            // },
          );
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (e) {
      if (e == DioError) {
        print(e.statusCode);
        print(e.data);
      }
      print(e);
    }
  }
}
