import 'package:biken/bloc/register/register_bloc.dart';
import 'package:biken/ui/Screens/login_screen.dart';
import 'package:biken/ui/components/widgets/cajasTexto.dart';
import 'package:flutter/material.dart';
import 'package:biken/ui/components/widgets/botonPrincipal.dart';
import 'package:biken/ui/components/widgets/icono_biken.dart';
import 'package:biken/ui/styles/painter.dart';
import 'package:biken/ui/components/sociales.dart';
import 'package:biken/ui/components/textFooter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController emailController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  bool _showPassword = false;
  @override
  void initState() {
    initializer();
    super.initState();
  }

  RegisterBloc _registerBloc;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailuredState) {
          _showError(context, state.msg, Colors.red);
          print('Error de registro');
        }
        if (state is RegisterSuccessState) {
          _showError(context, state.msg, HexColor('#2059BD'));
          print('Registro correcto');
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Login()));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomPaint(
          painter: MypainterBiken(),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                .onDrag, //oculta el teclado al mover el Scroll
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return Container(
                        child: Column(
                          children: [
                            IconoBiken(),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 26.0),
                                  child: Column(
                                    children: [
                                      TextBoxBiken(
                                        controller: emailController,
                                        placeholder: 'Correo Electronico',
                                        tipoTexto: TextInputType.emailAddress,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      TextBoxBiken(
                                        controller: password1Controller,
                                        placeholder: 'Contraseña',
                                        icono: Icons.remove_red_eye,
                                        verContrasena: verPassword(),
                                        verCaracteres: !this._showPassword,
                                        tipoTexto: TextInputType.text,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      TextBoxBiken(
                                        controller: password2Controller,
                                        placeholder: 'Repite tu contraseña',
                                        icono: Icons.remove_red_eye,
                                        verContrasena: verPassword(),
                                        verCaracteres: !this._showPassword,
                                        tipoTexto: TextInputType.text,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      if (state is RegisterLoadingState)
                                        CircularProgressIndicator(
                                          color: HexColor('#2059BD'),
                                        )
                                      else
                                        Container(
                                          height: 50,
                                          child: BotonPrincipal(
                                            onPressed: doRegister,
                                            textBoton: 'Registrarse',
                                            ruta: '/completionScreenRegister',
                                            tag: 'botonRegistro',
                                          ),
                                        ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      Sociales(),
                                      TextoFooter(
                                        ruta: '/login',
                                        frase: '¿Ya eres miembro?',
                                        wordclave: 'Inicia Sesión',
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void doRegister() {
    _registerBloc.add(RegisterUserEvent(
        email: emailController.text,
        password1: password1Controller.text,
        password2: password2Controller.text));
  }

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

  void initializer() {
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    emailController = TextEditingController();
    password1Controller = TextEditingController();
    password2Controller = TextEditingController();
  }

  void _showError(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
