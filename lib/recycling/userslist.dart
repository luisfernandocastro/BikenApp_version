// import 'package:biken/bloc/users/users_bloc.dart';
// import 'package:biken/models/usersModel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class UsersPage extends StatefulWidget {
//   @override
//   _UsersPageState createState() => _UsersPageState();
// }

// class _UsersPageState extends State<UsersPage> {
//   final UsersBloc _newsBloc = UsersBloc();

//   @override
//   void initState() {
//     _newsBloc.add(UsersListEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('COVID-19 List')),
//       body: _buildListCovid(),
//     );
//   }

//   Widget _buildListCovid() {
//     return Container(
//       margin: EdgeInsets.all(8.0),
//       child: BlocProvider(
//         create: (_) => _newsBloc,
//         child: BlocListener<UsersBloc, UsersState>(
//           listener: (context, state) {
//             if (state is UserErrorState) {
//               Scaffold.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(state.msg),
//                 ),
//               );
//             }
//           },
//           child: BlocBuilder<UsersBloc, UsersState>(
//             // ignore: missing_return
//             builder: (context, state) {
//               if (state is UsersInitial) {
//                 return _buildLoading();
//               } else if (state is UserLoadingState) {
//                 return _buildLoading();
//               } else if (state is UserLoadedState) {
//                 return _buildCard(context, state.userModel);
//               } else if (state is UserErrorState) {
//                 return Container();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCard(BuildContext context, Users model) {
//     return ListView.builder(
//       itemCount: model.email.length,
//       itemBuilder: (context, index) {
//         return Container(
//           margin: EdgeInsets.all(8.0),
//         );
//       },
//     );
//   }

//   Widget _buildLoading() => Center(child: CircularProgressIndicator());
// }
