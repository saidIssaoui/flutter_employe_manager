import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_app/flutter-icons/plus_slim.dart';
import 'package:mobile_app/models/employees.dart';
import 'package:mobile_app/models/task_model.dart';
import 'package:mobile_app/screens/Addtask/add_task.dart';
import 'package:mobile_app/screens/Addtask/task.dart';
import 'package:mobile_app/screens/Home/components/home_card.dart';
import 'package:mobile_app/models/user_model.dart';
import 'package:mobile_app/screens/Home/skeleton/constants.dart';
import 'package:mobile_app/screens/Home/skeleton/skeleton.dart';
import 'package:mobile_app/screens/Navbar/bottom_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _selectedValue = DateTime.now();
  final DatePickerController _controller = DatePickerController();
  @override
  void initState() {
    checkLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.92,
          child: DatePicker(
            DateTime.now(),
            width: 60,
            height: 84,
            controller: _controller,
            initialSelectedDate: DateTime.now(),
            selectionColor: const Color(0xFF57ba46),
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
              setState(() {
                _selectedValue = date;
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            const SizedBox(width: 5),
            Row(
              children: [
                OutlinedButton(
                  child: const Text(
                    "List Employées",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF57ba46),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.35, 35),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(
                                counterindex: 1,
                              )),
                    );
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                OutlinedButton.icon(
                  icon: const Icon(
                    PlusSlim.plus_small,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: const Text(
                    "Ajouter",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF57ba46),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.35, 35),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    _showMyBottomSheet();
                  },
                ),
              ],
            ),
            const SizedBox(width: 5),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Aujourd'hui",
                  style: TextStyle(fontSize: 14.0, color: Colors.black26),
                ),
                Text(
                  "Total Taches",
                  style: TextStyle(fontSize: 14.0, color: Colors.black26),
                ),
                SizedBox(height: 10),
                Text(
                  "240",
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                ),
                Text(
                  "Taches",
                  style: TextStyle(fontSize: 12.0, color: Colors.black26),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Total ",
                  style: TextStyle(fontSize: 14.0, color: Colors.black26),
                ),
                Text(
                  "Fait",
                  style: TextStyle(fontSize: 14.0, color: Colors.black26),
                ),
                SizedBox(height: 10),
                Text(
                  "240",
                  style: TextStyle(fontSize: 18.0, color: Color(0xFF57ba46)),
                ),
                Text(
                  "Tâches",
                  style: TextStyle(fontSize: 12.0, color: Colors.black26),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Aujourd'hui",
                  style: TextStyle(fontSize: 14.0, color: Colors.black26),
                ),
                Text(
                  "Total en cours",
                  style: TextStyle(fontSize: 14.0, color: Colors.black26),
                ),
                SizedBox(height: 10),
                Text(
                  "240",
                  style: TextStyle(fontSize: 18.0, color: Colors.orange),
                ),
                Text(
                  "Tâches",
                  style: TextStyle(fontSize: 12.0, color: Colors.black26),
                )
              ],
            )
          ],
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: ListView.separated(
                    itemCount: 10,
                    itemBuilder: (context, index) => const NewsCardSkelton(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: defaultPadding),
                  ),
                );
              }

              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return HomeCard(
                    home: TaskModel(
                        uid: document.id,
                        taskNumber: document['number'],
                        employuid: document['employeUid'],
                        avatar: document['employeImage'],
                        name: document['employeName'],
                        job: document['selectedEmployeJob'],
                        status: document['status']),
                    press: () {},
                  );
                }).toList(),
              );
            },
          ),
        ),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: 0,
        //     itemBuilder: (context, index) =>
        //         HomeCard(home: Employee.data[index], press: () => {}),
        //   ),
        // ),
      ],
    );
  }

  void _showMyBottomSheet() {
    // the context of the bottomSheet will be this widget
    //the context here is where you want to showthe bottom sheet
    showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        context: context,
        builder: (BuildContext context) {
          return AddTask();
        });
  }

  checkLocation() async {
    Location location = new Location();

    late bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.always) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }
}
