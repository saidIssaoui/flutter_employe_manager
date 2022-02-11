import 'package:flutter/material.dart';
import 'package:mobile_app/screens/Home/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NetPlus',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 87, 186, 70),
        ),
        // home: MyHomePage(
        //   counterindex: 0,
        // ),
        home: const Wrapper());
  }
}
