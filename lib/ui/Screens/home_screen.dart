import 'package:biken/ui/Screens/Quienessomos.dart';
import 'package:biken/ui/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/rendering.dart';
import 'package:biken/ui/styles/biken_icons_icons.dart';
import 'package:biken/ui/Screens/screens_home/start_Screen.dart';

const _maxSize = 35.0;
bool expanded = false;

class ScreenHome extends StatefulWidget {
  ScreenHome({
    Key key,
  }) : super(key: key);

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int pageActual = 1;
  List<Widget> pages = [
    Login(),
    ScreenStart(),
    Quienessomos(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(32.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          child: AppBar(
            leading: Text(
              'Biken',
              style: TextStyle(
                color: HexColor('#2059BD'),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            actions: [
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ],
            foregroundColor: Colors.transparent,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(top: 20),
        height: size.height * 0.15,
        width: size.width * 0.15,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              this.pageActual = 1;
            });
          },
          heroTag: null,
          elevation: 10,
          backgroundColor:
              this.pageActual == 1 ? HexColor('#2059BD') : Colors.white,
          child: Icon(
            Icons.home,
            size: 27,
            color: this.pageActual == 1 ? Colors.white : Colors.grey[700],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages[pageActual],
      bottomNavigationBar: tabBarAnimated(),
    );
  }

  Widget tabBarAnimated() {
    return SizedBox(
      height: _maxSize,
      child: BottomNavigationBar(
        iconSize: 25.0,
        unselectedFontSize: 0.0,
        selectedFontSize: 0.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: HexColor('#2059BD'),
        onTap: (index) {
          setState(() {
            pageActual = index;
          });
        },
        currentIndex: pageActual,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.signInAlt,
                size: 24,
              ),
              label: 'Sube tu Bici'),
          BottomNavigationBarItem(
            label: 'Inicio',
            icon: Icon(
              Icons.home,
              size: 4.0,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(BikenIcons.question_fill), label: 'Quiénes somos?')
        ],
      ),
    );
  }
}
