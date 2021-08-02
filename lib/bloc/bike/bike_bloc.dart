import 'dart:async';

import 'package:biken/api/apiBike_repositoy.dart';
import 'package:biken/models/bicicletaModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bike_event.dart';
part 'bike_state.dart';

class BikeBloc extends Bloc<BikeEvent, BikeState> {
  BikeBloc() : super(BikeInitial());

  final ApiBikeRepository _apiBikeRepository = ApiBikeRepository();

  @override
  Stream<BikeState> mapEventToState(
    BikeEvent event,
  ) async* {
    if (event is ListBikeEvent) {
      try {
        yield BikeLoadingState();
        final bList = await _apiBikeRepository.listBike();
        yield BikeSuccessState(bList);
        // if (bList.error != null) {
        //   yield BikeFailureState('bList.error');
        // }
      } on NetworkError {
        yield BikeFailureState(
            "No se pudieron recuperar los datos. ¿Está tu dispositivo en línea?");
      }
    }
  }
}
