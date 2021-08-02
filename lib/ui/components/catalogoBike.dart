import 'package:biken/bloc/bike/bike_bloc.dart';
import 'package:biken/models/bicicletaModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class CatalogoBike extends StatefulWidget {
  CatalogoBike({Key key}) : super(key: key);

  @override
  _CatalogoBikeState createState() => _CatalogoBikeState();
}

class _CatalogoBikeState extends State<CatalogoBike> {
  final BikeBloc _bikeBloc = BikeBloc();

  void initState() {
    _bikeBloc.add(ListBikeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                return _createCardBike(context, state.bicicletaModel);
              } else if (state is BikeFailureState) {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _createCardBike(BuildContext context, List<BicicletaModel> model) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: ListView.builder(
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: model.length,
        itemBuilder: (context, index) {
          return Container(
            height: size.height * 0.60,
            decoration: BoxDecoration(
              // color: HexColor('#F2F2F3'),
              borderRadius: BorderRadius.circular(15.0),
              //   gradient: LinearGradient(
              //       colors: [Colors.yellow, Colors.orange, Colors.red],
              //       stops: [0.5, 0.5, 0.8],
              //       begin: FractionalOffset.topCenter,
              //       end: FractionalOffset.bottomCenter),
            ),
            child: Column(
              children: [
                Spacer(),
                Container(
                  height: size.height * 0.45,
                  child: Card(
                    // margin: EdgeInsets.all(5.0),
                    shadowColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 15.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                        image: NetworkImage('${model[index].foto}'),
                        width: size.width * 0.85,
                        fit: BoxFit.fill,
                      ),
                      // child: FadeInImage(
                      //   fit: BoxFit.contain,
                      //   image: NetworkImage('${model[index].foto}'),
                      //   placeholder: AssetImage('assets/images/loading.gif'),
                      // ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 2.0),
                  child: Column(
                    children: [
                      Text(
                        '${model[index].categoria.nombre}',
                        style: TextStyle(
                            fontSize: size.height * 0.017,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        '${model[index].user.firstName} ${model[index].user.lastName}',
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
