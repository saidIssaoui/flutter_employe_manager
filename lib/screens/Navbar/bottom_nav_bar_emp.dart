import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mobile_app/UserInterface/catalog.dart';
import 'package:mobile_app/screens/Notification/notification.dart';
import 'package:mobile_app/screens/Settinges/settings.dart';
import 'package:mobile_app/screens/chats/chats_screen.dart';

class MyHomePageEmploye extends StatefulWidget {
  var counterindex = 0;

  MyHomePageEmploye({Key? key, required this.counterindex}) : super(key: key);

  @override
  State<MyHomePageEmploye> createState() => _MyHomePageEmployeState();
}

class _MyHomePageEmployeState extends State<MyHomePageEmploye> {
  List<Widget> pageList = <Widget>[
    Catalog(),
    const NotificationScreen(),
    ChatsScreen(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[widget.counterindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        selectedIconTheme: const IconThemeData(color: Colors.blue),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: widget.counterindex,
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: "Home"),
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
  }
}
