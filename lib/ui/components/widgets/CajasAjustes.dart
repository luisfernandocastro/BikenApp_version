import 'package:flutter/material.dart';

class CajasAjustes extends StatelessWidget {
  const CajasAjustes({
    Key key,
    @required this.titulo,
    this.subtitulo = "",
    @required this.iconoleading,
    this.colorleading = Colors.black,
    this.trailing,
    this.ruta,
  }) : super(key: key);
  final String titulo;
  final String subtitulo;
  final IconData iconoleading;
  final Color colorleading;
  final Widget trailing;
  final String ruta;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            iconoleading,
            color: colorleading,
          ),
        ),
        title: Text('$titulo'),
        subtitle: Text('$subtitulo'),
        dense: true,
        onTap: () {
          Navigator.of(context).pushNamed('$ruta');
        },
        trailing: trailing,
      ),
    );
  }
}
