import 'package:biken/bloc/login/login_bloc.dart';
import 'package:biken/ui/Screens/homeUser.dart';
import 'package:biken/ui/components/textFooter.dart';
import 'package:biken/ui/components/widgets/cajasTexto.dart';
import 'package:flutter/material.dart';
import 'package:biken/ui/components/widgets/botonPrincipal.dart';
import 'package:biken/ui/components/contrasenaOlvidada.dart';
import 'package:biken/ui/components/sociales.dart';
import 'package:biken/ui/components/widgets/icono_biken.dart';
import 'package:biken/ui/styles/painter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  Login({
    Key key,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    initializer();
    super.initState();
  }

  LoginBloc _loginBloc;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailuredState) {
          _showError(context, state.msg, Colors.red);
          print('Error al iniciar sesion');
        }
        if (state is LoginSuccessState) {
          _showError(context, state.msg, HexColor('#2059BD'));
          print('Bienvenido');
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeUser()));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomPaint(
          painter: MypainterBiken(),
          child: SingleChildScrollView(
            //importate widget al momento de aparecer el teclado
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
            //.onDrag, //oculta el teclado al mover el Scroll
            child: SafeArea(
              child: Center(
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return Container(
                      height: size.height * 0.95,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Spacer(),
                            IconoBiken(),
                            Spacer(),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30.0,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      TextBoxBiken(
                                        placeholder: 'Correo',
                                        tipoTexto: TextInputType.emailAddress,
                                        controller: emailController,
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      TextBoxBiken(
                                        placeholder: 'Contraseña',
                                        icono: Icons.remove_red_eye,
                                        verContrasena: verPassword(),
                                        verCaracteres: !this._showPassword,
                                        tipoTexto: TextInputType.text,
                                        controller: passwordController,
                                      ),
                                      RecordarPassword(),
                                      BotonPrincipal(
                                        textBoton: 'Iniciar sesión',
                                        // ruta: '/ScreenHomeUser',
                                        onPressed: doLogin,
                                        tag: 'IniciaSesion',
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            if (state is LoginLoadingState)
                              CircularProgressIndicator(
                                color: HexColor('#2059BD'),
                              )
                            else
                              Sociales(),
                            Spacer(),
                            TextoFooter(
                              ruta: '/Registro',
                              frase: '¿Aún no estás en Biken?',
                              wordclave: 'Registrate',
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Funcion para  mostrar contraseña en textField

  Widget verPassword() {
    return IconButton(
      icon: Icon(
        Icons.remove_red_eye,
        color: this._showPassword ? Colors.blue[900] : Colors.grey[400],
      ),
      onPressed: () {
        setState(() => this._showPassword = !this._showPassword);
      },
    );
  }

  void doLogin() {
    final validEmail =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(validEmail);
    if (emailController.text.isEmpty) {
      //
      print('1,completa este campo');
    } else if (!regExp.hasMatch(emailController.text)) {
      //
      print('2,correo inválido');
    } else {
      if (passwordController.text.length < 5) {
        print('3,contraseña mayor a 6 caracteres');
      } //
      else {
        _loginBloc.add(LoginSigninEvent(
            email: emailController.text, password: passwordController.text));
      }
    }
  }

  void initializer() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void _showError(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
