import 'package:biken/bloc/bike/bike_bloc.dart';
import 'package:biken/models/bicicletaModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ItemsRecientes extends StatefulWidget {
  ItemsRecientes({Key key}) : super(key: key);

  @override
  _ItemsRecientesState createState() => _ItemsRecientesState();
}

class _ItemsRecientesState extends State<ItemsRecientes> {
  BikeBloc _bikeBloc = BikeBloc();

  void initState() {
    _bikeBloc.add(ListBikeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool _activate = false;
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _bikeBloc,
        child: BlocListener<BikeBloc, BikeState>(
          listener: (context, state) {
            if (state is BikeFailureState) {
              _showError(context, state.msg, Colors.red);
            }
          },
          child: BlocBuilder<BikeBloc, BikeState>(
            // ignore: missing_return
            builder: (context, state) {
              if (state is BikeInitial) {
                return _createLoadingBike();
              } else if (state is BikeLoadingState) {
                return _createLoadingBike();
              } else if (state is BikeSuccessState) {
                return _bikeReciente(context, state.bicicletaModel);
              } else if (state is BikeFailureState) {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _bikeReciente(BuildContext context, List<BicicletaModel> model) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.35,
      child: ListView.builder(
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: model.length,

        //items de listview
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            },
            child: Container(
              height: size.height,
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
              width: 130,
              child: Card(
                shadowColor: Colors.transparent,
                child: Container(
                  height: size.height,
                  child: Column(
                    children: [
                      Spacer(),
                      Card(
                        // margin: EdgeInsets.all(5.0),
                        shadowColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 15.0,
                        child: Stack(
                          children: [
                            Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    height: size.height * 0.18,
                                    width: size.width,
                                    image: NetworkImage('${model[index].foto}'),
                                  )
                                  //  FadeInImage(
                                  //   image: NetworkImage('${model[index].foto}'),
                                  //   placeholder:
                                  //       AssetImage('assets/images/loading.gif'),
                                  // ),
                                  ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 6.0),
                                  child: InkWell(
                                    onTap: () {
                                      // setState(() {
                                      //   _activate = !_activate;
                                      // });
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      size: 17,
                                      //   color: _activate == false
                                      //       ? Colors.grey
                                      //       : Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 2.0),
                        child: Column(
                          children: [
                            Text(
                              'Bicicleta de ${model[index].categoria.nombre}',
                              style: TextStyle(
                                  fontSize: size.height * 0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              '${model[index].material.nombre}',
                              style: TextStyle(fontSize: size.height * 0.017),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${model[index].precioalquiler}',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
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
        },
      ),
    );
  }

  Widget _createLoadingBike() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _showError(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
