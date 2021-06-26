import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ItemsCatalogo extends StatelessWidget {
  const ItemsCatalogo({
    Key key,
    @required this.imagen,
    @required this.texto,
    @required this.texto2,
    @required this.precio,
    @required this.activate,
  }) : super(key: key);

  final String imagen;
  final String texto;
  final String texto2;
  final String precio;
  final Color activate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/alquilarbici');
      },
      child: Container(
        height: size.height * 0.35,
        width: size.width * 0.40,
        margin: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15.0,
              offset: Offset(0, 10.0),
            )
          ],
        ),
        child: Card(
          shadowColor: Colors.transparent,
          child: Container(
            height: size.height,
            child: Column(
              children: [
                Spacer(),
                Container(
                  child: Card(
                    margin: EdgeInsets.all(10.0),
                    shadowColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 15.0,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: FadeInImage(
                            image: NetworkImage('$imagen'),
                            placeholder:
                                AssetImage('assets/images/loading.gif'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 6.0),
                              child: Icon(
                                Icons.favorite_border,
                                size: 17,
                                color: activate,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 5.0),
                  child: Column(
                    children: [
                      Text(
                        '$texto',
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      Text(
                        '$texto2',
                        style: TextStyle(fontSize: size.height * 0.018),
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '$precio',
                            style: TextStyle(
                              fontSize: size.height * 0.016,
                              color: HexColor('#2059BD'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final colorfavorite = Colors.grey;
  final colorfavoriteAct = Colors.red;
}
