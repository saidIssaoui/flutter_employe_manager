import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mobile_app/screens/EmployeList/employelist.dart';
import 'package:mobile_app/screens/Home/home.dart';
import 'package:mobile_app/screens/Notification/notification.dart';
import 'package:mobile_app/screens/Position/position.dart';
import 'package:mobile_app/screens/Settinges/settings.dart';
import 'package:mobile_app/screens/chats/chats_screen.dart';
import 'package:mobile_app/stats/stats_screen.dart';

class MyHomePage extends StatefulWidget {
  var counterindex = 0;

  MyHomePage({Key? key, required this.counterindex}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pageList = <Widget>[
    Home(),
    ListViewHome(),
    StatsScreen(),
    PositionWidget(),
    ChatsScreen(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: pageList[widget.counterindex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.white,
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: widget.counterindex,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(IconlyLight.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_rounded,
                  size: 40,
                ),
                label: "Employées"),
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.graph,
                ),
                label: "Statistique"),
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.notification,
                ),
                label: "Notification"),
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.message,
                ),
                label: "Messages"),
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.setting,
                ),
                label: "Settings")
          ],
          onTap: (index) {
            setState(() {
              widget.counterindex = index;
            });
          },
        ),
      );
    });
  }
}
