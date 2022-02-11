import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/screens/Navbar/bottom_nav_bar.dart';
import 'package:mobile_app/screens/Navbar/bottom_nav_bar_emp.dart';
import 'package:mobile_app/services/auth.dart';
import 'background.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool notValid = false;
  final AuthService _auth = AuthService();
  var notPasswordValid = false;
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  bool notPasswordEmailValid = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.11,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            if (notValid)
              const SizedBox(
                  child: Text('Invalid Email',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.red))),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            if (notPasswordValid)
              const SizedBox(
                  child: Text('Invalid Password',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.red))),
            if (notPasswordEmailValid)
              const SizedBox(
                  child: Text('Invalid Password or Email',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.red))),
            RoundedButton(
                text: "LOGIN",
                press: () async {
                  if (isValidEmail(email) && validatePassword(password)) {
                    setState(() => loading = true);
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        notPasswordEmailValid = true;
                        loading = false;
                        error = 'Could not sign in with those credentials';
                      });
                    } else {
                      var value;
                      var user = FirebaseAuth.instance.currentUser;
                      var collection =
                          FirebaseFirestore.instance.collection('users');
                      var docSnapshot = await collection.doc(user!.uid).get();
                      Map<String, dynamic>? data = docSnapshot.data();
                      // var value = data!['role'];

                      setState(() {
                        value = data!['role'];
                      });

                      if (value == "admin") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(counterindex: 0)));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePageEmploye(counterindex: 0)));
                      }
                    }
                  } else {
                    setState(() {
                      notPasswordEmailValid = true;
                    });
                  }
                }),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  bool isValidEmail(email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
