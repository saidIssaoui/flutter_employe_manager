import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:mobile_app/Map/map.dart';
import 'package:mobile_app/flutter-icons/check_circle.dart';
import 'package:mobile_app/flutter-icons/more.dart';
import 'package:mobile_app/flutter-icons/plus_slim_2.dart';
import 'package:mobile_app/screens/Addtask/dialog_coment.dart';
import 'package:mobile_app/screens/Addtask/dialogbar.dart';
import 'package:mobile_app/screens/Messages/message_screen.dart';
import 'package:mobile_app/services/auth.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TaskInfo extends StatefulWidget {
  const TaskInfo({Key? key, required this.uid, required this.image})
      : super(key: key);
  final uid;
  final image;
  @override
  _TaskInfoState createState() => _TaskInfoState();
}

class _TaskInfoState extends State<TaskInfo> {
  String client = "";

  var duration;

  var employeImage;

  String employeName = "";

  var employeUid;

  var selectedEmployeJob;

  String start = "";

  String end = "";

  String nameTask = "";

  var number;
  double percent = 0.0;
  String status = "";
  final AuthService _auth = AuthService();
  var type;

  var millisec;
  var milliToPercent = 0.0;
  var responseJson;

  DocumentSnapshot<Map<String, dynamic>>? userList;

  DateTime? stratTime;

  double distanceInMeters = 0;

  double laltitude = 0;

  double longitude = 0;

  var color;

  bool excute = true;

  @override
  void initState() {
    getProgress();
    _loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getProgress();

    var size = MediaQuery.of(context).size.width * 0.05;
    var size2 = MediaQuery.of(context).size.width * 0.03;
    var sizehight = MediaQuery.of(context).size.height * 0.02;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: sizehight,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(size, 8, size2, 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      CheckCircle.check_circle,
                      color: Color.fromARGB(255, 20, 211, 3),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                            width: 100,
                            height: 32,
                            child: TextField(
                              enabled: false,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 0.0,
                                        style: BorderStyle.none),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  hintText: "Terminer",
                                  fillColor: Color.fromARGB(255, 20, 211, 3)),
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapView()));
                            },
                            child:
                                const Icon(More.more_horiz, color: Colors.blue),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(0),
                              primary: const Color(0xfff0f2f0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(
              height: sizehight,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Employée"),
                      Text(
                        employeName,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 20, 211, 3),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        widget.image,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: sizehight,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMMd().format(DateTime.now()).toString(),
                    style: const TextStyle(
                        color: Colors.black26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    nameTask,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 34),
                  ),
                  Text(
                    client,
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: sizehight,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MessagesScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Message",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(140, 20),
                      backgroundColor: const Color(0xfff0f2f0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "ALERT",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(140, 20),
                      primary: Colors.white,
                      backgroundColor: const Color(0xffc4c4c7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: sizehight,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: 93,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xfff0f2f0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Date de debut",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            start,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: 93,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xfff0f2f0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Date de fin",
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            end,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: sizehight,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xfff0f2f0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Text(
                      "PLANNING DE LEMPLOYÉ",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  CustomDialog());
                        },
                        child: (millisec == null)
                            ? SizedBox(
                                height: 15,
                                child: LinearPercentIndicator(
                                  width:
                                      MediaQuery.of(context).size.width * 0.82,
                                  lineHeight: 14.0,
                                  percent: percent / 100,
                                  // center: Text(
                                  //   percent.toString() + "%",
                                  //   style: const TextStyle(
                                  //       fontSize: 12.0,
                                  //       fontWeight: FontWeight.w600,
                                  //       color: Colors.black),
                                  // ),
                                  barRadius: const Radius.circular(10.0),
                                  animationDuration: 1,
                                  animation: true,
                                  backgroundColor: Colors.white,
                                  progressColor: currentProgressColor(),
                                ),
                              )
                            : SizedBox(
                                height: 15,
                                child: LinearPercentIndicator(
                                  width:
                                      MediaQuery.of(context).size.width * 0.82,
                                  lineHeight: 14.0,
                                  percent: percent / 100,
                                  // center: Text(
                                  //   percent.toString() + "%",
                                  //   style: const TextStyle(
                                  //       fontSize: 12.0,
                                  //       fontWeight: FontWeight.w600,
                                  //       color: Colors.black),
                                  // ),
                                  barRadius: const Radius.circular(10.0),
                                  animation: true,
                                  animateFromLastPercent: true,
                                  backgroundColor: Colors.white,
                                  progressColor: currentProgressColor(),
                                ),
                              )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sizehight,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xfff0f2f0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: OutlinedButton.icon(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomDialogComment());
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 0, color: Color(0xfff0f2f0)),
                          ),
                          label: const Text(
                            "Commentaire",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          icon: const Icon(
                            PlusSlim2.plus_circled,
                            color: Colors.blue,
                            size: 15,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Text(
                          "Thursday, March 15",
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        "Graphic design is a craft where professionals create visual content to communicate messages. By applying visual hierarchy and page layout techniques, designers use typography and pictures to meet users' specific needs and focus on the logic of displaying elements in interactive designs, to optimize the user experience."),
                  )
                ],
              ),
            ),
            SizedBox(
              height: sizehight,
            ),
          ],
        ),
      ),
    );
  }

  _loadData() async {
    var coll = FirebaseFirestore.instance.collection('tasks');
    var qs = await coll.doc(widget.uid).get();
    Map<String, dynamic>? value = qs.data();
    if (mounted) {
      setState(() {
        client = value!['client'];
        duration = value['duration'];
        employeImage = value['employeImage'];
        employeName = value['employeName'];
        employeUid = value['employeUid'];
        selectedEmployeJob = value['selectedEmployeJob'];
        start = value['start'];
        end = value['end'];
        nameTask = value['nameTask'];
        number = value['number'];
        status = value['status'];
        type = value['type'];
        color = value['color'];
      });
    }
    var list = duration.split(':');
    var last = list[2].split('.');
    if (mounted) {
      setState(() {
        millisec = (((double.parse(list[0]) * 3600) +
                    (double.parse(list[1]) * 60) +
                    double.parse(last[0])) *
                1000) +
            double.parse(last[1]);
        milliToPercent = millisec * 0.005;
      });
    }
    _getUserLocation();

    // if (mounted) {
    //   if (percent < 100 &&
    //       DateTime.now().isAfter(stratTime!) &&
    //       distanceInMeters > 10 &&
    //       distanceInMeters != 0 &&
    //       excute == true) {
    //     updateProgress(widget.uid, percent, milliToPercent);
    //     setState(() {
    //       excute = false;
    //     });
    //   }
    // }
  }

  currentProgressColor() {
    if (percent >= 0.4 * 100 && percent < 0.7 * 100) {
      return Colors.orange;
    }
    if (percent >= 0.7 * 100) {
      return Colors.red;
    } else {
      return const Color.fromARGB(255, 20, 211, 3);
    }
  }

  void _getUserLocation() async {
    Location location = Location();
    location.onLocationChanged.listen((LocationData currentLocation) {
      if (mounted) {
        setState(() {
          laltitude = currentLocation.latitude!;
          longitude = currentLocation.longitude!;
        });
      }
      distanceInMeters = Geolocator.distanceBetween(
          35.7693897, 10.8115057, laltitude, longitude);
      if (mounted) {
        if (percent < 100 &&
            DateTime.now().isAfter(stratTime!) &&
            distanceInMeters > 10 &&
            distanceInMeters != 0 &&
            excute == true) {
          updateProgress(widget.uid, percent, milliToPercent);
          setState(() {
            excute = false;
          });
        }
      }
      if (kDebugMode) {
        //print(laltitude);
        // print(distanceInMeters);
      }
      // current user location
    });
  }

  Future<void> updateProgress(String uid, double progress, double timer) async {
    await http.put(
      Uri.parse(
          'http://192.168.1.29:5001/fluttermap01-335114/us-central1/app/api/updatetaskprogressbylocation'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'uid': uid,
        'progress': progress,
        'timer': timer,
      }),
    );

    //print(responseJson['progress']);
  }

  Future<void> getProgress() async {
    var collectionRef =
        FirebaseFirestore.instance.collection("tasks").doc(widget.uid);
    var data = await collectionRef.get();
    userList = data;
    Map<String, dynamic>? data1 = userList!.data();
    if (mounted) {
      setState(() {
        percent = data1!['progress'].toDouble();
        stratTime = DateTime.parse(data1['start']);

        //newNumber = 1;
      });
    }
    //print(percent);
  }
}
