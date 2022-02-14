import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/components/text_field_duration.dart';
import 'package:mobile_app/flutter-icons/plus_slim.dart';
import 'dart:ui';
import 'package:mobile_app/flutter-icons/plus_slim_2.dart';
import 'package:iconly/iconly.dart';
import 'package:mobile_app/components/rounded_button_Add.dart';
import 'package:mobile_app/components/rounded_input_type_field.dart';
import 'package:mobile_app/components/text_field_add_emp_container.dart';
import 'package:mobile_app/models/user_model.dart';
import 'package:mobile_app/screens/NewUser/components/dialog_progress_circle.dart';
import 'package:mobile_app/screens/NewUser/new_user.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:mobile_app/screens/profile/hero_dialog_route.dart';
import 'package:mobile_app/services/database.dart';
import 'package:recase/recase.dart';
import 'package:duration_picker/duration_picker.dart';
import 'dart:math' as math;
import 'package:place_picker/place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddTask extends StatefulWidget {
  AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  List allData = [];

  List<UserModel> delta = [];
  var list = [];
  bool enabledbutton = false;
  bool enabledbutton2 = false;

  String? selectedEmploye;
  double laltitude = 0;

  double longitude = 0;
  String? selectedEmployeUid;

  String? selectedEmployeImage;

  String? taskName;

  String? clientName;

  int taskNumber = 1;
  String newuid = '';
  bool allincorrect = false;

  List<Map<String, dynamic>> userList = [];

  var newNumber;

  String? selectedEmployeJob;

  int year = 0;

  int month = 0;

  int minute = 0;

  int day = 0;

  int hour = 0;

  int millisec = 0;

  @override
  void initState() {
    //getData();
    newuid = getRandomString(20);
    getLastTaskNumber();

    super.initState();
  }

  final dbRef = FirebaseFirestore.instance.collection('users');

  late List<UserModel> _userModel;

  TextEditingController v = TextEditingController();
  late UserModel selectedValue;
  String? typeSelected;
  var items = [
    'Type 1',
    'Type 2',
    'Type 3',
    'Type 4',
    'Type 5',
  ];

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  DateTime currentDate = DateTime.now();
  var dateFormate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  DateFormat timeFormat = DateFormat("HH:mm");
  DateFormat dateFormat = DateFormat("MM-dd-yyyy");
  String _startChanged = '';
  String _startToValidate = '';
  String _startSaved = '';
  String _endChanged = '';
  String _endToValidate = '';
  String _endSaved = '';
  String _durationChanged = '';
  String _durationToValidate = '';
  String _durationSaved = '';
  late Duration dur;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: const BoxDecoration(
                  color: Color(0xfff0f2f0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  //height: MediaQuery.of(context).size.height * 0.8,

                  children: [
                    AppBar(
                      backgroundColor: const Color(0xfff0f2f0),
                      centerTitle: false,
                      title: const Text(
                        "Nouveller Tache",
                      ),
                      titleTextStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      elevation: 0,
                      leadingWidth: 100,
                      automaticallyImplyLeading: false,
                      leading: OutlinedButton(
                        child: const Text(
                          "Annuler",
                          style: TextStyle(color: Colors.blue),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      color: const Color(0xfff0f2f0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text("Numéro de Tache"),
                                Text(
                                  (newNumber).toString(),
                                  style: const TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 0),
                              child: Container(
                                height:
                                    45, //gives the height of the dropdown button
                                width: MediaQuery.of(context).size.width *
                                    0.9, //gives the width of the dropdown button
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    color: Colors.white),
                                // padding: const EdgeInsets.symmetric(horizontal: 13), //you can include padding to control the menu items
                                child: Theme(
                                    data: Theme.of(context).copyWith(
                                        canvasColor: Colors
                                            .white, // background color for the dropdown items
                                        buttonTheme:
                                            ButtonTheme.of(context).copyWith(
                                          alignedDropdown:
                                              true, //If false (the default), then the dropdown's menu will be wider than its button.
                                        )),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        iconEnabledColor: Colors.blue,
                                        icon: const Icon(IconlyLight
                                            .arrow_right_2), // icon color of the dropdown button

                                        hint: const Text(
                                          'select le type',
                                          style: TextStyle(
                                              color: Color(0xFF8B8B8B),
                                              fontSize: 15),
                                        ), // setting hint
                                        items: items.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? value) {
                                          setState(() {
                                            typeSelected =
                                                value; // saving the selected value
                                          });
                                        },

                                        value:
                                            typeSelected, // displaying the selected value
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text("Employée"),
                                OutlinedButton.icon(
                                  icon: const Icon(
                                    PlusSlim.plus_small,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  label: const Text(
                                    "Ajouter",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width *
                                            0.35,
                                        35),
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const NewUser()));
                                  },
                                ),
                              ],
                            ),
                            Container(
                              height: 55,
                              color: Colors.white,
                              child: DropdownSearch<UserModel>(
                                mode: Mode.DIALOG,
                                showSearchBox: true,
                                filterFn: (instance, filter) {
                                  ReCase sample = ReCase(filter!);
                                  filter = sample.sentenceCase;
                                  if (instance!.name.contains(filter)) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                },
                                showSelectedItems: true,
                                compareFn: (i, s) => i?.isEqual(s) ?? false,
                                dropdownSearchDecoration: const InputDecoration(
                                  labelText: "Select",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 5, 0, 5),
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.search),
                                ),
                                onFind: (String? filter) => getData2(filter),
                                onChanged: (data) {
                                  selectedEmploye = data!.name;
                                  selectedEmployeUid = data.id;
                                  selectedEmployeImage = data.avatar;
                                  selectedEmployeJob = data.job;
                                },
                                popupItemBuilder:
                                    _customPopupItemBuilderExample2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text("Nom du tache"),
                              ],
                            ),
                            RoundedInputTypeField(
                              hintText: 'Nom du tache...',
                              onChanged: (value) {
                                taskName = value;
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text("Nom du client"),
                              ],
                            ),
                            TextFieldAddEmpContainer(
                              child: TextField(
                                onChanged: (value) {
                                  clientName = value;
                                },
                                decoration: InputDecoration(
                                  icon: IconButton(
                                      onPressed: () {
                                        showPlacePicker();
                                      },
                                      icon: const Icon(Icons.location_pin)),
                                  hintText: 'Nom du client...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            TextFieldAddEmpContainer(
                              child: DateTimePicker(
                                  type: DateTimePickerType.dateTime,
                                  dateMask: 'd MMMM, yyyy - hh:mm a',
                                  controller: _controller1,
                                  //initialValue: _initialValue,
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2050),
                                  //icon: Icon(Icons.event),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      PlusSlim2.plus_circled,
                                      color: Color.fromARGB(255, 87, 186, 70),
                                      size: 28,
                                    ),
                                    labelText: 'Date de debut',
                                  ),
                                  use24HourFormat: true,
                                  locale: const Locale('en', 'US'),
                                  onChanged: (val) {
                                    setState(() {
                                      enabledbutton = true;
                                      _startChanged = val;
                                      var list = _startChanged.split('-');
                                      var last = list[2].split(':');
                                      year = int.parse(list[0]);
                                      month = int.parse(list[1]);
                                      minute = int.parse(last[1]);
                                      day = int.parse(last[0].split(' ')[0]);
                                      hour = int.parse(last[0].split(' ')[1]);
                                      //print(day);
                                    });
                                  },
                                  validator: (val) {
                                    setState(() {
                                      enabledbutton = true;
                                      _startToValidate = val ?? '';
                                    });
                                    return null;
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      enabledbutton = true;
                                      _startSaved = val ?? '';
                                    });
                                  }),
                            ),
                            TextFieldAddEmpContainer(
                              child: enabledbutton
                                  ? DateTimePicker(
                                      enabled: true,
                                      type: DateTimePickerType.dateTime,
                                      dateMask: 'd MMMM, yyyy - hh:mm a',
                                      controller: _controller2,
                                      //initialValue: _initialValue,
                                      firstDate: DateTime(2022),
                                      lastDate: DateTime(2050),
                                      //icon: Icon(Icons.event),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        icon: Icon(
                                          PlusSlim2.plus_circled,
                                          color:
                                              Color.fromARGB(255, 87, 186, 70),
                                          size: 28,
                                        ),
                                        labelText: 'Date de fin',
                                      ),
                                      use24HourFormat: true,
                                      locale: const Locale('en', 'US'),
                                      onChanged: (val) => setState(() {
                                        enabledbutton2 = true;
                                        _endChanged = val;
                                        dur = DateTime.parse(_controller2.text)
                                            .difference(DateTime.parse(
                                                _controller1.text));
                                        _controller3.text = dur.toString();
                                        _durationChanged = dur.toString();
                                        var list = _durationChanged.split(':');
                                        var last = list[2].split('.');
                                        millisec = (((int.parse(list[0]) *
                                                        3600) +
                                                    (int.parse(list[1]) * 60) +
                                                    int.parse(last[0])) *
                                                1000) +
                                            int.parse(last[1]);
                                        //print(millisec);
                                      }),
                                      validator: (val) {
                                        setState(
                                            () => _endToValidate = val ?? '');
                                        return null;
                                      },
                                      onSaved: (val) =>
                                          setState(() => _endSaved = val ?? ''),
                                    )
                                  : DateTimePicker(
                                      enabled: enabledbutton,
                                      type: DateTimePickerType.dateTime,
                                      dateMask: 'd MMMM, yyyy - hh:mm a',
                                      controller: _controller2,
                                      //initialValue: _initialValue,
                                      firstDate: DateTime(2022),
                                      lastDate: DateTime(2050),
                                      //icon: Icon(Icons.event),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        icon: Icon(
                                          PlusSlim2.plus_circled,
                                          color: const Color.fromARGB(
                                              255, 87, 186, 70),
                                          size: 28,
                                        ),
                                        labelText: 'Date de fin',
                                      ),
                                      use24HourFormat: true,
                                      locale: const Locale('en', 'US'),
                                      onChanged: (val) =>
                                          setState(() => _endChanged = val),
                                      validator: (val) {
                                        setState(
                                            () => _endToValidate = val ?? '');
                                        return null;
                                      },
                                      onSaved: (val) =>
                                          setState(() => _endSaved = val ?? ''),
                                    ),
                            ),
                            TextFieldDuration(
                              child: TextFormField(
                                key: Key(_controller3.toString()),
                                controller: _controller3,
                                readOnly: true,
                                enabled: enabledbutton2,
                                onChanged: (value) {},
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  labelText: 'Durée de tache',
                                  icon: IconButton(
                                    icon: const Icon(
                                      PlusSlim2.plus_circled,
                                      color: Color.fromARGB(255, 87, 186, 70),
                                      size: 28,
                                    ),
                                    onPressed: () async {
                                      var resultingDuration =
                                          await showDurationPicker(
                                        context: context,
                                        initialTime:
                                            const Duration(minutes: 30),
                                        baseUnit: BaseUnit.minute,
                                      );
                                      setState(() {
                                        if (resultingDuration != null) {
                                          _controller3.text =
                                              resultingDuration.toString();
                                          _durationChanged =
                                              resultingDuration.toString();
                                          var list =
                                              _durationChanged.split(':');
                                          var last = list[2].split('.');
                                          millisec =
                                              (((int.parse(list[0]) * 3600) +
                                                          (int.parse(list[1]) *
                                                              60) +
                                                          int.parse(last[0])) *
                                                      1000) +
                                                  int.parse(last[1]);
                                          //print(millisec);
                                        }
                                      });
                                    },
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            if (allincorrect)
                              const SizedBox(
                                  child: Text('vérifier vos informations',
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red))),
                            RoundedButtonAdd(
                              text: "Ajouter",
                              press: () async {
                                taskNumber = newNumber;
                                if (selectedEmploye != null &&
                                    selectedEmployeImage != null &&
                                    selectedEmployeUid != null &&
                                    selectedEmployeJob != null &&
                                    clientName != null &&
                                    taskName != null &&
                                    taskNumber != null &&
                                    _startChanged != null &&
                                    _endChanged != null &&
                                    _durationChanged != null) {
                                  Navigator.push(context,
                                      HeroDialogRoute(builder: (context) {
                                    return CustomDialogProgressCircle();
                                  }));
                                  await DatabaseService(
                                          uid: selectedEmployeUid!)
                                      .addTask(
                                          newuid,
                                          taskNumber,
                                          typeSelected!,
                                          selectedEmployeUid!,
                                          selectedEmploye!,
                                          selectedEmployeImage!,
                                          selectedEmployeJob!,
                                          taskName!,
                                          clientName!,
                                          _startChanged,
                                          _endChanged,
                                          _durationChanged);
                                  updateProgress(newuid, 0, millisec * 0.005,
                                      year, month - 1, day, hour, minute, 0);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                } else {
                                  setState(() {
                                    allincorrect = true;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }

  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> getData() async {
    // Get docs from collection reference
    var querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var element in allData) {
      delta.add(UserModel(
          id: element["name"], job: element["name"], name: element["name"]));
    }
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, UserModel? item, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.name ?? ''),
        subtitle: Text(item?.job?.toString() ?? ''),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item!.avatar ?? ''),
        ),
      ),
    );
  }

  Future<List<UserModel>> getData2(filter) async {
    var querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //print(allData);
    if (allData != null) {
      return UserModel.fromJsonList(allData);
    }

    return [];
  }

  Future<void> getLastTaskNumber() async {
    var collectionRef = FirebaseFirestore.instance.collection("tasks");
    var data = await collectionRef
        .orderBy("timestamp", descending: true)
        .limit(1)
        .get();
    userList = data.docs.map((e) => (e.data())).toList();
    Map<String, dynamic>? data1 = userList.first;
    setState(() {
      newNumber = data1['number'] + 1;
      //newNumber = 1;
    });
  }

  Future<void> updateProgress(String uid, double progress, double timer,
      int year, int month, int day, int hour, int minute, int sec) async {
    await http.put(
      Uri.parse(
          'http://192.168.1.29:5001/fluttermap01-335114/us-central1/app/api/updatetaskprogress'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'uid': uid,
        'progress': progress,
        'timer': timer,
        'year': year,
        'month': month,
        'day': day,
        'hour': hour,
        'minute': minute,
        'sec': sec,
      }),
    );
  }

  void showPlacePicker() async {
    LocationData _currentPosition;
    Location location = Location();
    _currentPosition = await location.getLocation();
    setState(() {
      laltitude = _currentPosition.latitude!;
      longitude = _currentPosition.longitude!;
    });
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlacePicker(
              "Your_Api",
              displayLocation: LatLng(laltitude, longitude),
            )));

    // Handle the result in your way
    print('result : $result');
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
