import 'package:biken/ui/components/widgets/CajasNotificacion.dart';
import 'package:flutter/material.dart';

class Notificaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context);
    // Size size = MediaQuery.of(context).size;

    Widget espacio = SizedBox(
      height: 20,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Notificaciones',
                          style: TextStyle(
                            fontSize: 27,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    textodivider('Hoy'),
                    espacio,
                    CajasNotificacion(
                      titulo: 'Carla',
                      titulo2: 'Te envio un mensaje',
                      subtitulo: 'Hace 10 minutos',
                      imagen:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona1.jpg',
                    ),
                    CajasNotificacion(
                      titulo: 'Sara',
                      titulo2: 'Le gusta tu bici',
                      subtitulo: 'Hace 30 minutos',
                      imagen:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona2.jpg',
                    ),
                    CajasNotificacion(
                      titulo: 'Juan',
                      titulo2: 'Le gusta tu bici',
                      subtitulo: 'Hace 1 hora',
                      imagen:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona4.jpg',
                    ),
                    CajasNotificacion(
                      titulo: 'Manuel',
                      titulo2: 'Le gusta tu bici',
                      subtitulo: 'Hace 8 horas',
                      imagen:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona3.jpg',
                    ),
                    espacio,
                    textodivider('Ayer'),
                    SizedBox(
                      height: 15,
                    ),
                    CajasNotificacion(
                      titulo: 'Juan Pablo',
                      titulo2: 'Le gusta tu bici',
                      subtitulo: 'Hace 17 horas',
                      imagen:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona5.jpg',
                    ),
                    CajasNotificacion(
                      titulo: 'Sofia',
                      titulo2: 'Le gusta tu bici',
                      subtitulo: 'Hace 30 minutos',
                      imagen:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona6.jpg',
                    ),
                    CajasNotificacion(
                      titulo: 'Fernanda',
                      titulo2: 'Le gusta tu bici',
                      subtitulo: 'Hace 14 horas',
                      imagen:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona7.jpg',
                    ),
                    CajasNotificacion(
                      titulo: 'Luisa',
                      titulo2: 'Le gusta tu bici',
                      subtitulo: 'Hace 20 horas',
                      imagen:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona8.jpg',
                    ),
                    espacio,
                    textodivider('14/05/2021'),
                    SizedBox(
                      height: 15,
                    ),
                    CajasNotificacion(
                      titulo: 'Nicole',
                      titulo2: 'Le gusta tu bici',
                      subtitulo: 'Hace 1 dia',
                      imagen:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona9.jpg',
                    ),
                    CajasNotificacion(
                      titulo: 'Jarick',
                      titulo2: 'Le gusta tu bici',
                      subtitulo: 'Hace 22 horas',
                      imagen:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona10.jpg',
                    ),
                    CajasNotificacion(
                      titulo: 'Maicol',
                      titulo2: 'Te envio un mensaje',
                      subtitulo: 'Hace 30 minutos',
                      imagen:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona11.jpg',
                    ),
                    CajasNotificacion(
                      titulo: 'Santiago',
                      titulo2: 'Le gusta tu bici',
                      subtitulo: 'Hace 2 dias',
                      imagen:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona12.jpg',
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

  Widget textodivider(String textoprincipal) {
    return Row(
      children: [
        Text(
          textoprincipal,
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue[900],
          ),
        ),
      ],
    );
  }
}
