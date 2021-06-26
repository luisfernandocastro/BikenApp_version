part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

// ignore: must_be_immutable
class LoginSigninEvent extends LoginEvent {
  String email;
  String password;

  LoginSigninEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
