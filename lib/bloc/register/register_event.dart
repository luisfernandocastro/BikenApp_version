part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

// ignore: must_be_immutable
class RegisterUserEvent extends RegisterEvent {
  String email;
  String password1;
  String password2;

  RegisterUserEvent(
      {@required this.email,
      @required this.password1,
      @required this.password2});

  @override
  List<Object> get props => [email, password1, password2];
}
