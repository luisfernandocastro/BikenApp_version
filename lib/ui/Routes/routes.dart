import 'package:biken/recycling/bicicletasList.dart';
import 'package:biken/recycling/register_delete.dart';
import 'package:biken/ui/Screens/Ajustes.dart';
import 'package:biken/ui/Screens/Alquilarbici.dart';
import 'package:biken/ui/Screens/Condiciones.dart';
import 'package:biken/ui/Screens/Contacto.dart';
import 'package:biken/ui/Screens/Contrato.dart';
import 'package:biken/ui/Screens/Politicaprivacidad.dart';
import 'package:biken/ui/Screens/RecuperarPassword/recPasswordScreen1.dart';
import 'package:biken/ui/Screens/RecuperarPassword/recPasswordScreen2.dart';
import 'package:biken/ui/Screens/RecuperarPassword/recPasswordScreen3.dart';
import 'package:biken/ui/Screens/completionsScreens/completionAllScreen.dart';
import 'package:biken/ui/Screens/editProfileScreen.dart';
import 'package:biken/ui/Screens/homeUser.dart';
import 'package:biken/ui/Screens/home_screen.dart';
import 'package:biken/ui/Screens/login_screen.dart';
import 'package:biken/ui/Screens/profile_screen.dart';
import 'package:biken/ui/Screens/registro_screen.dart';
import 'package:biken/ui/Screens/screens_uploadBike/uploadBike_screen2.dart';
import 'package:biken/ui/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/splashScreen': (context) => SplashScreen(),
    '/login': (context) => Login(),
    '/Registro': (context) => Registro(),
    '/recuperarPasswordScreen1': (context) => RecuperarPassword(),
    '/recuperarPasswordScreen2': (context) => RecuperarPasswordScreen2(),
    '/recuperarPasswordScreen3': (context) => RecuperarPasswordScreen3(),
    '/ScreenHome': (context) => ScreenHome(),
    '/ScreenHomeUser': (context) => HomeUser(),
    '/Screenprofile': (context) => ProfileScreen(),
    '/ScreenEditProfile': (context) => EditProfileScreen(),
    '/ScreenUploadBike2': (context) => ScreenUploadBike2(),
    '/completionScreenPassword': (context) => CompletionScreenPassword(),
    '/completionScreenUpload': (context) => CompletionScreenUpload(),
    '/completionScreenRegister': (context) => CompletionScreenRegister(),
    '/completionScreenContrato': (context) => CompletionScreenContrato(),
    '/completionScreenContacto': (context) => CompletionScreenComment(),
    '/politicayprivacidad': (context) => Politicaprivacidad(),
    '/alquilarbici': (context) => Alquilarbici(),
    '/contrato': (context) => Contrato(),
    '/contacto': (context) => Contacto(),
    '/ajustes': (context) => Ajustes(),
    '/condiciones': (context) => Condiciones(),
    '/LoadingPage': (context) => LoadingPage(),
    '/registerApi': (context) => DeleteRegister(),
    '/Bikepage': (context) => BikePage(),
  };
}
