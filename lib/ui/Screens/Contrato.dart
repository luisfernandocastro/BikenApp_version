import 'package:biken/ui/components/widgets/appbar.dart';
import 'package:biken/ui/components/widgets/botonPrincipal.dart';
import 'package:biken/ui/components/widgets/cajasTexto.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Contrato extends StatefulWidget {
  @override
  _ContratoState createState() => _ContratoState();
}

class _ContratoState extends State<Contrato> {
  bool checked = false;
  bool checkbox1 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget espacio = SizedBox(
      height: 22,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(32),
        child: AppbarBiken(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(right: 30, left: 30, top: 20),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Formulario de Contrato',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue[900],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  TextBoxBiken(
                    placeholder: 'Fecha Inicio 12/02/2021',
                    tipoTexto: TextInputType.text,
                    color: Colors.grey[300],
                  ),
                  espacio,
                  TextBoxBiken(
                    placeholder: 'Nombres y Apellidos',
                    tipoTexto: TextInputType.text,
                  ),
                  espacio,
                  TextBoxBiken(
                    placeholder: 'Núm de Identificación',
                    tipoTexto: TextInputType.number,
                  ),
                  espacio,
                  TextBoxBiken(
                    placeholder: 'Dirección',
                    tipoTexto: TextInputType.text,
                  ),
                  espacio,
                  TextBoxBiken(
                    placeholder: 'Periodo de Tiempo',
                    tipoTexto: TextInputType.number,
                  ),
                  espacio,
                  TextBoxBiken(
                    placeholder: 'Foto Doc de Identidad',
                    tipoTexto: TextInputType.number,
                    verContrasena: Icon(
                      Icons.linked_camera_rounded,
                      color: HexColor('#2059BD'),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              activeColor: Colors.blue[900],
                              value: checked,
                              onChanged: (checkbox1) {
                                setState(() {
                                  checked = checkbox1;
                                });
                              }),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('/condiciones');
                                },
                                child: Container(
                                  width: size.width * 0.6,
                                  child: Text(
                                    'He leído el contrato y acepto los términos y condiciones',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black54),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  BotonPrincipal(
                    textBoton: 'Finalizar Proceso',
                    ruta: '/completionScreenContrato',
                    tag: 'AceptoContrato',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
