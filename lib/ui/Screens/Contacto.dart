import 'package:biken/ui/components/widgets/appbar.dart';
import 'package:biken/ui/components/widgets/botonPrincipal.dart';
import 'package:biken/ui/components/widgets/icono_biken.dart';
import 'package:flutter/material.dart';

class Contacto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(32),
        child: AppbarBiken(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(23.0),
              child: Column(
                children: [
                  IconoBiken(),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    child: Text(
                      "Dejanos tu comentario u opinión y en pocos días Biken te dara una respuesta",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: 'Escribe aquí',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  BotonPrincipal(
                    textBoton: 'Enviar',
                    ruta: '/completionScreenContacto',
                    tag: 'EnviarMensaje',
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
