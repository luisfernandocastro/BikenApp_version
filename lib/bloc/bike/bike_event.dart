part of 'bike_bloc.dart';

abstract class BikeEvent extends Equatable {
  const BikeEvent();
}

class ListBikeEvent extends BikeEvent{

  @override
  List<Object> get props => null;

}