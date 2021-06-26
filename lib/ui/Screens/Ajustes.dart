import 'package:biken/ui/Screens/home_screen.dart';
import 'package:biken/ui/components/widgets/CajasAjustes.dart';
import 'package:biken/ui/components/widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Ajustes extends StatefulWidget {
  @override
  _AjustesState createState() => _AjustesState();
}

class _AjustesState extends State<Ajustes> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    Widget espacio = SizedBox(
      height: 15,
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(32),
        child: AppbarBiken(),
      ),

      /* AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        title: barrasuperior(),
      ), */
      body: ListView(
        children: [
          Container(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    barrasuperior(),
                    espacio,
                    textodivider('Configuración de Cuenta'),
                    espacio,
                    CajasAjustes(
                      titulo: 'Editar Pérfil',
                      subtitulo: 'Nombre_Email_Usuario',
                      iconoleading: Icons.person_outline,
                      ruta: '/ScreenEditProfile',
                    ),
                    espacio,
                    CajasAjustes(
                      titulo: 'Imagenes',
                      subtitulo: 'Control de tus imagenes en biken',
                      iconoleading: Icons.image_outlined,
                    ),
                    espacio,
                    CajasAjustes(
                      titulo: 'Enviar notificaciones Push',
                      iconoleading: Icons.notifications_none,
                      trailing: Switch(
                        activeColor: Colors.blue[900],
                        value: toggle,
                        onChanged: (bool value) {
                          setState(() {
                            toggle = value;
                          });
                        },
                      ),
                    ),
                    espacio,
                    Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.login,
                            color: Colors.blue[900],
                          ),
                        ),
                        title: Text('Cerrar Sesión'),
                        dense: true,
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => ScreenHome()));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    textodivider('General'),
                    espacio,
                    CajasAjustes(
                      titulo: 'Calificar nuestra App',
                      subtitulo: 'Calificanos',
                      iconoleading: Icons.favorite_border,
                    ),
                    espacio,
                    CajasAjustes(
                      titulo: 'Enviar comentarios',
                      subtitulo: 'Comparte tu opinión',
                      iconoleading: Icons.email_outlined,
                      ruta: '/contacto',
                    ),
                    espacio,
                    CajasAjustes(
                      titulo: 'Política y privacidad',
                      iconoleading: Icons.visibility_off_outlined,
                      ruta: '/politicayprivacidad',
                    ),
                    espacio,
                    CajasAjustes(
                      titulo: 'Eliminar mi cuenta',
                      iconoleading: Icons.delete_outline,
                      colorleading: Colors.red,
                    ),
                    espacio,
                    CajasAjustes(
                      titulo: 'Actualizaciones',
                      iconoleading: Icons.cached_outlined,
                      trailing: Icon(
                        Icons.stop_circle,
                        color: Colors.red,
                        size: 14,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    textodivider('Soporte'),
                    espacio,
                    CajasAjustes(
                      titulo: 'Ayuda',
                      iconoleading: Icons.help_outline,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CajasAjustes(
                      titulo: 'FAQ',
                      iconoleading: Icons.question_answer_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget barrasuperior() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ' Ajustes',
          style: TextStyle(
            fontSize: 27,
            color: Colors.black,
          ),
        ),
        Icon(
          Icons.settings,
          size: 28,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget textodivider(String textoprincipal) {
    return Row(
      children: [
        Text(
          textoprincipal,
          style: TextStyle(
            fontSize: 17,
            color: Colors.blue[900],
          ),
        ),
      ],
    );
  }
}
