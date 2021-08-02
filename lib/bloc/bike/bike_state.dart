part of 'bike_bloc.dart';

abstract class BikeState extends Equatable {
  const BikeState();
}

class BikeInitial extends BikeState {
  const BikeInitial();

  @override
  List<Object> get props => [];
}

class BikeLoadingState extends BikeState {
  const BikeLoadingState();

  @override
  List<Object> get props => null;
}

class BikeSuccessState extends BikeState {
  final List<BicicletaModel> bicicletaModel;

  const BikeSuccessState(this.bicicletaModel);

  @override
  List<Object> get props => [bicicletaModel];
}

class BikeFailureState extends BikeState {
  final String msg;
  const BikeFailureState(this.msg);

  @override
  List<Object> get props => [msg];
}
