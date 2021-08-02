import 'package:biken/bloc/bike/bike_bloc.dart';
import 'package:biken/models/bicicletaModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BikePage extends StatefulWidget {
  BikePage({key}) : super(key: key);

  @override
  _BikePageState createState() => _BikePageState();
}

class _BikePageState extends State<BikePage> {
  final BikeBloc _bikeBloc = BikeBloc();

  void initState() {
    _bikeBloc.add(ListBikeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Bicicletas Biken'),
      ),
      body: _createListBike(),
    );
  }

  Widget _createListBike() {
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
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Text('id: ${model[index].idmibicicleta}'),
              Text('Usuario: ${model[index].user.lastName}'),
              Text('Usuario: ${model[index].disponible}'),
              Text('color: ${model[index].color}'),
              // Text('foto: ${model.foto}'),
              Image(image: NetworkImage('${model[index].foto}'))
            ],
          ),
        );
      },
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
