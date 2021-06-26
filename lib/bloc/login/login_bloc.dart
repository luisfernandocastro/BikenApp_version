import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginSigninEvent) {
      yield LoginLoadingState(rem: true);
      await Future.delayed(Duration(seconds: 2));
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: event.email, password: event.password);
        yield LoginSuccessState(msg: 'inicio de Sesión correcto');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          yield LoginFailuredState(
              msg: 'Ningún usuario encontrado para este correo electrónico.');
          print('Ningún usuario encontrado para este correo electrónico.');
        } else if (e.code == 'wrong-password') {
          yield LoginFailuredState(msg: 'Contraseña incorrecta.');
          print('Contraseña incorrecta.');
        }
      }
    }
  }
}
