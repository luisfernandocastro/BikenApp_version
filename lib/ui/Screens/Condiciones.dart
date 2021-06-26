import 'package:biken/ui/components/widgets/botonPrincipal.dart';
import 'package:biken/ui/components/widgets/icono_biken.dart';
import 'package:flutter/material.dart';

class Condiciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    Widget espacio = SizedBox(
      height: 12,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[50],
      ),
      body: ListView(
        children: [
          Container(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(26.0),
                child: Column(
                  children: [
                    IconoBiken(),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'BIKEN es el propietario de las bicicletas de alquiler. Para asegurar que la bicicleta se utiliza correctamente y para garantizar que cada usuario se comporta de manera responsable con esta, el arrendatario esta de acuerdo en:',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          espacio,
                          Text(
                            '• Ser responsable del cuidado y devolución de la bicicleta. Las bicicletas serán inspeccionadas al momento de su entrega. Han de ser devueltas en el mismo estado que al ser alquiladas, haciendose cargo el usuario de cuaqluier desperfecto ocasionado. En caso de robo o pérdida del material, el usuario tendrá la obligación de abonar el importe del material sustraído',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          espacio,
                          Text(
                            '• El usuario conoce y se compromete a respetar las leyes y normas de tráfico y es responsable de todo daño causado como consecuencia de cualquier accidente durante el uso de la bicicleta',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          espacio,
                          Text(
                            '• BIKEN no se hace responsable de ningún tipo de reclamaciones. El usuario está obligado en todo momento a candar correctamente la bicicleta. Para evitar robos es recomendable candarla siempre del cuadro y rueda en lugares fijos.',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          espacio,
                          Text(
                            '• No se efectuará reembolso por devolución antes de la hora estipulada en el contrato.',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          espacio,
                          Text(
                            '• El retraso en la devolución de la/s bicicleta/s supondrá el abono de la tarifa correspondida.',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          espacio,
                          Text(
                            '• Los datos facilitados por el cliente, serán utilizados exclusivamente para la correcta prestación del servicio contratado, pudiendo solicitar, de acuerdo con la ley, su acceso, rectificación, cancelación u oposición mediante comunicación por cualquier medio al arrendador',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    BotonPrincipal(
                      textBoton: 'Aceptar',
                      ruta: '/contrato',
                      tag: 'AceptoCondiciones',
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
}
