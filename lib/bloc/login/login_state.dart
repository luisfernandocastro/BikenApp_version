part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class LoginLoadingState extends LoginState {
  bool rem;

  LoginLoadingState({this.rem});

  @override
  List<Object> get props => [rem];
}

// ignore: must_be_immutable
class LoginSuccessState extends LoginState {
  String msg;

  LoginSuccessState({this.msg});

  @override
  List<Object> get props => [msg];
}

// ignore: must_be_immutable
class LoginFailuredState extends LoginState {
  String msg;

  LoginFailuredState({this.msg});

  @override
  List<Object> get props => [msg];
}
