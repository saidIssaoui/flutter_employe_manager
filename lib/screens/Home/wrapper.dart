import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mobile_app/screens/Login/login_screen.dart';
import 'package:mobile_app/screens/Navbar/bottom_nav_bar_emp.dart';
import 'package:mobile_app/screens/Navbar/bottom_nav_bar.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  var value;

  getinfo() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var user = FirebaseAuth.instance.currentUser;
      var collection = FirebaseFirestore.instance.collection('users');
      var docSnapshot = await collection.doc(user!.uid).get();
      Map<String, dynamic>? data = docSnapshot.data();
      // var value = data!['role'];
      if (mounted) {
        setState(() {
          value = data!['role'];
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getinfo();
  }

  @override
  Widget build(BuildContext context) {
    // AuthService().signOut();
    // getinfo();

    if (FirebaseAuth.instance.currentUser != null) {
      if (value == "admin") {
        return Scaffold(body: MyHomePage(counterindex: 0));
      } else {
        return Scaffold(body: MyHomePageEmploye(counterindex: 0));
      }
    } else {
      return const Scaffold(
        body: LoginScreen(),
      );
    }
  }
}
