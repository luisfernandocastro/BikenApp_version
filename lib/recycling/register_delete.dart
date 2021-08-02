import 'package:biken/api/myApi.dart';
import 'package:biken/bloc/register/register_bloc.dart';
import 'package:biken/ui/components/widgets/cajasTexto.dart';
import 'package:flutter/material.dart';
import 'package:biken/ui/components/widgets/botonPrincipal.dart';
import 'package:biken/ui/components/widgets/icono_biken.dart';
import 'package:biken/ui/styles/painter.dart';
import 'package:biken/ui/components/sociales.dart';
import 'package:biken/ui/components/textFooter.dart';

class DeleteRegister extends StatefulWidget {
  DeleteRegister({Key key}) : super(key: key);

  @override
  _DeleteRegisterState createState() => _DeleteRegisterState();
}

class _DeleteRegisterState extends State<DeleteRegister> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  bool _showPassword = false;
  @override
  void initState() {
    // initializer();
    super.initState();
  }

  RegisterBloc _registerBloc;
  MyApi myApi = MyApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Container(
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
                                  controller: usernameController,
                                  placeholder: 'Nombre de Usuario',
                                  tipoTexto: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                TextBoxBiken(
                                  placeholder: 'Email',
                                  controller: emailController,
                                  tipoTexto: TextInputType.text,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                TextBoxBiken(
                                  controller: passwordController,
                                  icono: Icons.remove_red_eye,
                                  placeholder: 'Contraseña',
                                  verContrasena: verPassword(),
                                  verCaracteres: !this._showPassword,
                                  tipoTexto: TextInputType.text,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
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
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Sociales(),
                                TextoFooter(
                                  ruta: '/login',
                                  frase: '¿Ya eres miembro?',
                                  wordclave: 'Inicia Sesión',
                                ),
                                example(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
    myApi.register(
        // username: usernameController.text,
        // email: emailController.text,
        // password: passwordController.text,
        );
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

  void _showError(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  Widget example() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Image(
          image: NetworkImage('http://192.168.101.9:8000/media/bicicleta.jpg')),
    );
  }
}
