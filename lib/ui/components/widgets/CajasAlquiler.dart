import 'package:flutter/material.dart';

class CajasAlquiler extends StatelessWidget {
  const CajasAlquiler({
    Key key,
    @required this.texto1,
    @required this.texto2,
    this.icono,
  }) : super(key: key);
  final String texto1;
  final String texto2;
  final IconData icono;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              texto1,
              style: TextStyle(
                fontSize: 13,
                color: Colors.blue[900],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Icon(
                  icono,
                  color: Colors.green,
                  size: 12,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(texto2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
