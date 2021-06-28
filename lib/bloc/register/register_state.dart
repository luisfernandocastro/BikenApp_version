part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class RegisterLoadingState extends RegisterState {
  bool rem;

  RegisterLoadingState({@required this.rem});

  @override
  List<Object> get props => [rem];
}

// ignore: must_be_immutable
class RegisterSuccessState extends RegisterState {
  String msg;

  RegisterSuccessState({@required this.msg});

  @override
  List<Object> get props => [msg];
}

// ignore: must_be_immutable
class RegisterFailuredState extends RegisterState {
  String msg;

  RegisterFailuredState({@required this.msg});

  @override
  List<Object> get props => [msg];
}
