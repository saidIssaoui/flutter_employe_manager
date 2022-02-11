import 'package:flutter/material.dart';
import 'package:mobile_app/constants.dart';
import 'package:mobile_app/screens/Login/login_screen.dart';
import 'package:mobile_app/services/auth.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        child: ElevatedButton(
          child: const Text(
            'Sign Out',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            AuthService().signOut();

            if (AuthService().signOut() == null) {
              AuthService().signOut();
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            }
          },
          style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
