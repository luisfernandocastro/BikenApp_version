import 'package:biken/ui/components/widgets/botonPrincipal.dart';
import 'package:biken/ui/components/widgets/cajasTexto.dart';
import 'package:biken/ui/components/widgets/transicionCirculares.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenUploadBike extends StatefulWidget {
  ScreenUploadBike({Key key}) : super(key: key);

  @override
  _ScreenUploadBikeState createState() => _ScreenUploadBikeState();
}

class _ScreenUploadBikeState extends State<ScreenUploadBike> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizedBox sizedBox = SizedBox(height: 25);
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Container(
            height: size.height * .85,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CirculosNumericos(
                        numero: '1',
                        colorCirculo: Color.fromRGBO(32, 89, 189, 1),
                      ),
                      CirculosNumericos(
                        numero: '2',
                        colorCirculo: Color.fromRGBO(32, 89, 189, 0.5),
                      ),
                      CirculosNumericos(
                        numero: '3',
                        colorCirculo: Color.fromRGBO(32, 89, 189, .2),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          Text('Caracteristicas de tu Bicicleta'),
                          sizedBox,
                          TextBoxBiken(
                            placeholder: 'Tipo',
                            tipoTexto: TextInputType.text,
                          ),
                          sizedBox,
                          TextBoxBiken(
                            placeholder: 'Material',
                            tipoTexto: TextInputType.text,
                          ),
                          sizedBox,
                          TextBoxBiken(
                            placeholder: 'Color',
                            tipoTexto: TextInputType.text,
                          ),
                          sizedBox,
                          TextBoxBiken(
                            placeholder: 'Valor Alquiler',
                            tipoTexto: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  BotonPrincipal(
                    marginHorizontal: 30.0,
                    textBoton: 'Continuar',
                    ruta: '/ScreenUploadBike2',
                    tag: 'BotonBikeUpload1',
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
