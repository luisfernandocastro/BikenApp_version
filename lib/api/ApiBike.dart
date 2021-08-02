import 'dart:convert';

import 'package:biken/models/bicicletaModel.dart';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

class ApiBike {
  final Dio _dio = Dio();

  // ignore: non_constant_identifier_names
  Future<List<BicicletaModel>> listBike() async {
    try {
      // final String _url = 'http://192.168.101.9:8000/api/bicicletas/';
      final response = await http.get(Uri.parse('http://192.168.101.9:8000/api/bicicletas/'));

      if (response.statusCode == 200) {
        final json = response.body;
        final jsonList = jsonDecode(json) as List;

        // List<BicicletaModel> list = <BicicletaModel>[];

        //var bicicleta = BicicletaModel.fromJson(json[0]);
        // var i = 1;

        // while (i <= json) {
        //   var bicicleta = BicicletaModel.fromJson(json[i]);
        //   list.add(bicicleta);
        //   i++;
        // }

        // int num = 0;
        // for (var i in jsonList) {
        // // return jsonList.map((e) => BicicletaModel.fromJson(e)).toList();
        //   var bicicleta = BicicletaModel.fromJson(json[i]);
        //   list.add(bicicleta);
        // }

        // return list;
        return jsonList.map((e) => BicicletaModel.fromJson(e)).toList();
      } else {
        return null;
      }
      // return BicicletaModel.fromJson(json[6]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      // return BicicletaModel.withError(
      //     "Datos no encontrados o tiene problema de conexión");
    }
  }
}
