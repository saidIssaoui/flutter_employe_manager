import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/// Example [Widget] showing the functionalities of the geolocator plugin
class PositionWidget extends StatefulWidget {
  const PositionWidget({Key? key}) : super(key: key);

  @override
  _PositionPositionWidgetState createState() => _PositionPositionWidgetState();
}

class _PositionPositionWidgetState extends State<PositionWidget> {
  String _locationMessage = "";

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // if (kDebugMode) {
    //   print(position);
    // }

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });
  }

  // This widget is the root of your Positionlication.
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            body: Align(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_locationMessage),
            TextButton(
                onPressed: () {
                  _getCurrentLocation();
                },
                child: Text("Find Location"))
          ]),
    )));
  }
}
