import 'package:animate_do/animate_do.dart';
import 'package:biken/ui/styles/painter.dart';
import 'package:flutter/material.dart';

import 'botonPrincipal.dart';

class CompletionScreen extends StatelessWidget {
  const CompletionScreen({
    Key key,
    @required this.textPrimary,
    @required this.textSecundary,
    @required this.textButton,
    @required this.navegationRuta,
    this.textSubtitle = '',
  }) : super(key: key);

  final String textPrimary,
      textSecundary,
      textButton,
      textSubtitle,
      navegationRuta;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
        painter: MypainterBiken(),
        child: SafeArea(
          child: Center(
            child: Container(
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      height: 250,
                      width: 250,
                      child: ZoomIn(
                        child: Image.asset(
                          'assets/images/check.png',
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          Text(
                            '$textPrimary', //'Genial!',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$textSecundary', //'¡su contraseña se ha restablecido correctamente! ahora  inicie sesión con su nueva contraseña.',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '$textSubtitle', //'¡su contraseña se ha restablecido correctamente! ahora  inicie sesión con su nueva contraseña.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: BotonPrincipal(
                          textBoton: '$textButton',
                          ruta: '$navegationRuta',
                          tag: 'btncompletion1'),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
