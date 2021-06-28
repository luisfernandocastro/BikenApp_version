import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

final validEmail =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = RegExp(validEmail);

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterUserEvent) {
      if (event.email.isEmpty) {
        yield RegisterFailuredState(msg: 'El campo Email es requerido');
      } else if (!regExp.hasMatch(event.email)) {
        yield RegisterFailuredState(msg: 'Correo Electonio Invalido');
      } else {
        if (event.password1.length > 5) {
          if (event.password1 == event.password2) {
            yield RegisterLoadingState(rem: true);
            await Future.delayed(Duration(seconds: 3));
            try {
              UserCredential userCredential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: event.email, password: event.password1);
              yield RegisterSuccessState(msg: 'Registro correcto');
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                yield RegisterFailuredState(
                    msg: 'La contraseña es demasiado común');
                print('La contraseña es demasiado común');
              } else if (e.code == 'email-already-in-use') {
                print('Ya existe una cuenta con este correo electronico.');
                yield RegisterFailuredState(
                    msg: 'Ya existe una cuenta con este correo');
              }
            } catch (e) {
              print(e);
            }
          } else {
            yield RegisterFailuredState(msg: 'Las contraseñas no coinciden');
          }
        } else {
          yield RegisterFailuredState(
              msg: 'La contraseña debe ser mayor a 6 caracteres');
        }
      }
    }
  }
}
