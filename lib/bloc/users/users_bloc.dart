// import 'dart:async';

// import 'package:biken/api/api_repository.dart';
// import 'package:biken/models/usersModel.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'users_event.dart';
// part 'users_state.dart';

// class UsersBloc extends Bloc<UsersEvent, UsersState> {
//   final ApiRepository _apiRepository = ApiRepository();
//   UsersBloc() : super(UsersInitial());

//   @override
//   Stream<UsersState> mapEventToState(
//     UsersEvent event,
//   ) async* {
//     if (event is UsersListEvent) {
//       try {
//         yield UserLoadingState(true);
//         final userList = await _apiRepository.UserList();
//         yield UserLoadedState(userList);
//         if (userList.error != null) {
//           yield UserErrorState(userList.error);
//         }
//       } on NetworkError {
//         yield UserErrorState(
//             'No se pudieron recuperar los datos. ¿Está tu dispositivo en línea?');
//       }
//     }
//   }
// }
