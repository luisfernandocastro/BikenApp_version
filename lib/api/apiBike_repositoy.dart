import 'package:biken/api/ApiBike.dart';
import 'package:biken/models/bicicletaModel.dart';

class ApiBikeRepository {
  final _bike = ApiBike();

  // ignore: non_constant_identifier_names
  Future<List<BicicletaModel>> listBike() {
    return _bike.listBike();
  }
}

class NetworkError extends Error {}
