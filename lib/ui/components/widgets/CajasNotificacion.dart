import 'package:flutter/material.dart';

class CajasNotificacion extends StatelessWidget {
  const CajasNotificacion({
    Key key,
    @required this.titulo,
    @required this.titulo2,
    @required this.subtitulo,
    @required this.imagen,
  }) : super(key: key);
  final String titulo;
  final String titulo2;
  final String subtitulo;
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imagen),
        ),
        title: Row(
          children: [
            Text('$titulo'),
            SizedBox(
              width: 5,
            ),
            Text(
              '$titulo2',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        subtitle: Text('$subtitulo'),
        trailing: Icon(
          Icons.close,
          size: 18,
        ),
        dense: true,
        onTap: () {},
      ),
    );
  }
}
