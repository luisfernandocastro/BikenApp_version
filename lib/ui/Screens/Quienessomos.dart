import 'package:biken/ui/components/widgets/icono_biken.dart';
import 'package:flutter/material.dart';

class Quienessomos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          child: Column(
            children: [
              Spacer(),
              IconoBiken(),
              Spacer(),
              textoqs(context),
              Spacer(),
              btnpyp(context),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget textoqs(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(
        "La App BIKEN (Alquiler y Gestion de Bicicletas) se realiza con el fin de mejorar la movilidad de transporte en la ciudad de Popayán, haciendo uso de este vehículo y teniendo como beneficios la reducción de niveles de contaminación ambiental, el mejoramiento de la salud tanto fisica como emocional, y el ahorro de dinero por parte del cliente. Tambien conseguir con facilidad y a precios comodos una bicicleta rentada, ya que muchas veces el cliente no cuenta con los recursos suficientes para hacer compra de una de estas.",
        style: TextStyle(
          fontSize: size.height * 0.02,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget btnpyp(BuildContext context) {
    return Container(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/politicayprivacidad');
            },
            child: Text(
              'Lee nuestra Política y Privacidad',
              style: TextStyle(color: Colors.blue[800], fontSize: 16),
            )));
  }
}
