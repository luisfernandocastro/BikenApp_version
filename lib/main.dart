import 'package:biken/ui/Routes/routes.dart';
import 'package:biken/ui/Screens/homeUser.dart';
import 'package:biken/ui/Screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'bloc/login/login_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
      ],
      child: new MaterialApp(
        routes: getApplicationRoutes(),
        initialRoute: '/LoadingPage',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'ABeeZee',
        ),
        title: 'Biken',
        //home: SplashScreen(),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return Scaffold(
            body: Center(
              child: Text('Error ${snapshot.error}'),
            ),
          );
        if (snapshot.connectionState == ConnectionState.done)
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  Object user = snapshot.data;
                  if (user == null) {
                    return SplashScreen();
                  } else {
                    return HomeUser();
                  }
                }
                return Scaffold(
                  body: Center(
                    child: Text('Verificando autententicacion ...'),
                  ),
                );
              });
        else
          return Scaffold(
            body: Center(
              child: Text('Conectando a la App..'),
            ),
          );
      },
    );
  }
}
