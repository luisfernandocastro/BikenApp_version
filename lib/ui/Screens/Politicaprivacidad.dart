import 'package:biken/ui/components/widgets/botonPrincipal.dart';
import 'package:flutter/material.dart';

class Politicaprivacidad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget espacio = SizedBox(
      height: 28,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Container(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Política y Privacidad',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue[900],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Su privacidad es importante para nosotros. Es política de BIKEN respetar su privacidad con respecto a cualquier informacion que podamos recopilar de usted a través de nuestro sitio web y otros sitios que poseemos y operamos.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          espacio,
                          Text(
                            'solicitamos información personal cuando realmente es conveniente, para asi brindarle un buen servicio.La recopilamos por medios justos y legales, con su conocimiento y consentimiento.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          espacio,
                          Text(
                            'Se retiene la información recopilada durante el tiempo que sea necesario para brindarle el servicio solicitado. Los datos que almacenamos los protegemos con medios comercialmente aceptables para evitar pérdidas y robos, asi como el acceso, divulgación, copia, uso o modificación no autorizados.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          espacio,
                          Text(
                            'No compartimos ninguna información de identificación personal, públicamente ni con terceros,excepto cuando asi lo requiera la ley.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          espacio,
                          Text(
                            'Nuestro sitio web puede tener enlaces a sitios externos que no son operados por nosotros. Debe tener en cuenta que no tenemos control sobre el contenido y las prácticas de estos sitios, no podemos aceptar responsabilidad u obligación por sus respectivas políticas de privacidad.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          espacio,
                          Text(
                            'Eres libre de rechazar nuestra solicitud sobre tu información personal, con el entendimiento de que es posible que no logremos brindarte algunos de los servicios que desees',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          espacio,
                          Text(
                            'Su uso continuado de nuestro sitio web, se considerará como la aceptación de nuestras prácticas en materia de privacidad e información personal. Si tiene alguna duda sobre como manejamos los datos del usuario e información personal,no dude en contactarnos.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.arrow_upward_rounded,
          color: Colors.blue[900],
          size: 35,
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BotonPrincipal(
          textBoton: 'Estoy de acuerdo con esto',
          ruta: '/ScreenHome',
          tag: 'AceptoPolitica',
        ),
      ),
    );
  }
}
