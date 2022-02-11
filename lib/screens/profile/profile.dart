import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mobile_app/components/rounded_show_field.dart';
import 'package:mobile_app/models/sheck_Satutus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String _heroAddTodo = 'add-todo-hero';
const String _heroAddTodo2 = 'add-todo-hero-2';

class ProfileCared extends StatefulWidget {
  const ProfileCared({Key? key, required this.uid}) : super(key: key);
  final uid;
  @override
  State<ProfileCared> createState() => _ProfileCaredState();
}

class _ProfileCaredState extends State<ProfileCared> {
  @override
  String firstname = '';

  String username = '';

  String role = '';

  String phone = '';

  String adress = '';

  String hourRate = '';

  String job = '';

  String test = '';

  String image = '';
  String userEmail = '';
  @override
  void initState() {
    getUser(widget.uid);
    _loadData();
    super.initState();
    _loadData();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.22),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Hero(
                  tag: _heroAddTodo,
                  child: Material(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            Text(
                              firstname,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Opacity(
                              opacity: 0.64,
                              child: Text(
                                job,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 0.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Aujourd'hui",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black26),
                                    ),
                                    Text(
                                      "Total Taches",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black26),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black87),
                                    ),
                                    Text(
                                      "Taches",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black26),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Total ",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black26),
                                    ),
                                    Text(
                                      "Fait",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black26),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xFF57ba46)),
                                    ),
                                    Text(
                                      "Tâches",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black26),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Aujourd'hui",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black26),
                                    ),
                                    Text(
                                      "Total en cours",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black26),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.orange),
                                    ),
                                    Text(
                                      "Tâches",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black26),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.18,
            right: MediaQuery.of(context).size.width * 0.35,
            child: CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage(image),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            right: MediaQuery.of(context).size.width * 0.10,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 12.5,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close, color: Colors.grey),
                    )),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.22 + 220),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Hero(
                    tag: _heroAddTodo2,
                    child: Material(
                      color: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RoundedShwoField(
                                icon: Icon(IconlyBold.message),
                                preicon: IconlyLight.edit,
                                hintText: userEmail,
                                onChanged: (value) {},
                              ),
                              RoundedShwoField(
                                icon: Icon(IconlyBold.location),
                                preicon: IconlyLight.edit,
                                hintText: adress,
                                onChanged: (value) {},
                              ),
                              RoundedShwoField(
                                icon: Icon(IconlyBold.call),
                                preicon: IconlyLight.edit,
                                hintText: phone,
                                onChanged: (value) {},
                              ),
                              RoundedShwoField(
                                icon: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.030,
                                      4,
                                      0,
                                      0),
                                  child: const Text(
                                    "\$",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.grey),
                                  ),
                                ),
                                preicon: IconlyLight.edit,
                                hintText: hourRate,
                                onChanged: (value) {},
                              ),
                              RoundedShwoField(
                                icon: Icon(IconlyLight.user),
                                preicon: IconlyLight.edit,
                                hintText: role,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _loadData() async {
    var coll = FirebaseFirestore.instance.collection('users');
    var qs = await coll.doc(widget.uid).get();
    Map<String, dynamic>? value = qs.data();

    setState(() {
      role = value!['role'];
      hourRate = value['houRate'];
      phone = value['phone'];
      job = value['job'];
      firstname = value['name'];
      username = value['userName'];
      image = value['Image'];
      adress = value['adress'];
    });
  }

  //Get User Status
  Future<userSatatus> getUser(String uid) async {
    final response = await http.get(
      Uri.parse(
          'http://192.168.1.29:5001/fluttermap01-335114/us-central1/app/api/getUserbyId/' +
              uid),
    );

    // If the server did return a 200 OK response,
    // then parse the JSON.
    Map<String, dynamic> responseJson = jsonDecode(response.body);
    //print(responseJson['disabled']);
    setState(() {
      userEmail = responseJson['email'];
    });
    //responseJson.map((m) => usersState.add(userSatatus.fromJson(m))).toList();
    return userSatatus.fromJson(jsonDecode(response.body));
  }
}
