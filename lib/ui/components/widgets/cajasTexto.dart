//Widget  que crea los campos de texto en el login
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextBoxBiken extends StatefulWidget {
  TextBoxBiken(
      {Key key,
      @required this.placeholder,
      this.color,
      this.icono,
      this.verContrasena,
      this.verCaracteres = false,
      this.controller,
      @required this.tipoTexto})
      : super(key: key);

  final String placeholder;
  final IconData icono;
  final Widget verContrasena;
  final bool verCaracteres;
  final TextInputType tipoTexto;
  TextEditingController controller;
  Color color = Colors.grey[400];

  @override
  _TextBoxBikenState createState() => _TextBoxBikenState();
}

class _TextBoxBikenState extends State<TextBoxBiken> {
  @override
  Widget build(BuildContext context) {
    String intext = '';
    return Container(
      //height: 35.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 20.0, offset: Offset(0, 10))
          ]),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: widget.controller,
              onChanged: (value) {
                value = intext;
                print(intext);
              },
              keyboardType: widget.tipoTexto,
              obscureText: widget.verCaracteres,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "${widget.placeholder}",
                hintStyle: TextStyle(color: widget.color),
                suffixIcon: widget.verContrasena,
              ),
              //obscureText: verCaracteres,
            ),
          ),
        ],
      ),
    );
  }
}
