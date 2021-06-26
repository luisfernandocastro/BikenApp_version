import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppbarBiken extends StatelessWidget {
  const AppbarBiken({Key key, this.title = ''}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios, color: HexColor('#2059BD')),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          '$title',
          style: TextStyle(
            color: HexColor('#2059BD'),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
