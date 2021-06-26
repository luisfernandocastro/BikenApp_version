import 'package:biken/ui/components/widgets/CajasAlquiler.dart';
import 'package:biken/ui/components/widgets/appbar.dart';
import 'package:biken/ui/components/widgets/botonPrincipal.dart';
import 'package:biken/ui/components/widgets/customcards.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:hexcolor/hexcolor.dart';

class Alquilarbici extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(32),
        child: AppbarBiken(title: 'BIKEN'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomCards(
                      sizeHeight: size.height * 0.3,
                      sizeWidth: size.width * 0.8,
                      imageCard:
                          'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/bike1.jpg'),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona5.jpg'),
                        ),
                        title: Text('Miguel Fernandez'),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('miguel54_09'),
                            SizedBox(
                              width: 20,
                            ),
                            TextButton.icon(
                                icon: Icon(
                                  Icons.messenger_outline_sharp,
                                  color: Colors.grey[700],
                                  size: 19,
                                ),
                                label: Text(
                                  'Enviar Mensaje',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.blue[800],
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shadowColor: HexColor('#2059BD'),
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {}
                                //   padding: EdgeInsets.symmetric(horizontal: 3),
                                //   color: Colors.white,
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(20),
                                //   ),
                                ),
                          ],
                        ),
                        dense: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            '  Especificaciones',
                            style: TextStyle(
                                fontSize: 16, color: Colors.blue[800]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CajasAlquiler(texto1: 'Tipo', texto2: 'Montaña'),
                      SizedBox(
                        height: 15,
                      ),
                      CajasAlquiler(texto1: 'Material', texto2: 'Metal'),
                      SizedBox(
                        height: 15,
                      ),
                      CajasAlquiler(
                          texto1: 'Color',
                          texto2: 'Verde',
                          icono: Icons.stop_circle),
                      SizedBox(
                        height: 15,
                      ),
                      CajasAlquiler(
                          texto1: 'Valor Alquiler', texto2: '\$15.000'),
                      SizedBox(
                        height: 50,
                      ),
                      BotonPrincipal(
                        textBoton: 'Alquilar esta Bici',
                        ruta: '/contrato',
                        tag: 'AlquilerBicicleta',
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
