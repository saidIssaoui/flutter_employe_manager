import 'package:flutter/material.dart';
import 'package:mobile_app/flutter-icons/cancel_circled.dart';
import 'package:mobile_app/flutter-icons/info.dart';
import 'package:mobile_app/flutter-icons/minus_circled.dart';
import 'package:mobile_app/flutter-icons/pencil_circeled.dart';
import 'package:mobile_app/models/employees.dart';
import 'package:mobile_app/screens/EmployeList/components/dialog_delete.dart';
import 'package:mobile_app/screens/EmployeList/components/dialog_disable.dart';
import 'package:mobile_app/screens/EmployeList/components/dialog_enable.dart';
import 'package:mobile_app/models/sheck_Satutus.dart';
import 'package:mobile_app/screens/NewUser/update_user.dart';
import 'package:mobile_app/screens/profile/hero_dialog_route.dart';
import 'package:mobile_app/screens/profile/profile.dart';
import 'package:mobile_app/services/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../constants.dart';

class EditEmployeeCard extends StatefulWidget {
  EditEmployeeCard({
    Key? key,
    required this.employee,
  }) : super(key: key);

  final Employee employee;
  @override
  State<EditEmployeeCard> createState() => _EditEmployeeCardState();
}

class _EditEmployeeCardState extends State<EditEmployeeCard> {
  final AuthService _auth = AuthService();
  late Future<userSatatus> futureAlbum;
  bool userStatus = false;
  List<userSatatus> usersState = [];

  @override
  void initState() {
    getUser(widget.employee.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(usersState);
    // getUser(widget.employee.uid);
    return (!userStatus)
        ? Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(widget.employee.image),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.employee.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          Opacity(
                            opacity: 0.64,
                            child: Text(
                              widget.employee.job,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Wrap(spacing: 12, // space between two icons
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => UpdateUser(
                                    uid: widget.employee.uid,
                                  ),
                                ),
                              );
                            },
                            child: const Icon(
                              PencilCirceled.pencil_circled,
                              color: Colors.blue,
                              size: 13,
                            ),
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(HeroDialogRoute(builder: (context) {
                            return ProfileCared(
                              uid: widget.employee.uid,
                            );
                          }));
                        },
                        child: const Icon(
                          Info.info,
                          color: Colors.blue,
                          size: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                CustomDialogDisable(
                              fullname: widget.employee.name,
                              uid: widget.employee.uid,
                            ),
                          );
                        },
                        child: const Icon(
                          MinusCircled.minus_circled,
                          color: Colors.orange,
                          size: 16,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) =>
                                  CustomDialogDelete(
                                uid: widget.employee.uid,
                                fullname: widget.employee.name,
                              ),
                            );
                          },
                          child: const Icon(
                            CancelCircled.cancel_circle,
                            color: Colors.red,
                            size: 16,
                          )),
                    ])
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage:
                                NetworkImage(widget.employee.image),
                          ),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.employee.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            Opacity(
                              opacity: 0.64,
                              child: Text(
                                widget.employee.job,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Wrap(spacing: 12, // space between two icons
                        children: <Widget>[
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          UpdateUser(
                                        uid: widget.employee.uid,
                                      ),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  PencilCirceled.pencil_circled,
                                  color: Colors.blue,
                                  size: 13,
                                ),
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(HeroDialogRoute(builder: (context) {
                                return ProfileCared(
                                  uid: widget.employee.uid,
                                );
                              }));
                            },
                            child: const Icon(
                              Info.info,
                              color: Colors.blue,
                              size: 16,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomDialogEnable(
                                  fullname: widget.employee.name,
                                  uid: widget.employee.uid,
                                ),
                              );
                            },
                            child: const Icon(
                              MinusCircled.minus_circled,
                              color: Colors.green,
                              size: 16,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CustomDialogDelete(
                                    uid: widget.employee.uid,
                                    fullname: widget.employee.name,
                                  ),
                                );
                              },
                              child: const Icon(
                                CancelCircled.cancel_circle,
                                color: Colors.red,
                                size: 16,
                              )),
                        ]),
                    SizedBox(
                        width: 100,
                        height: 30,
                        child: TextField(
                          controller: TextEditingController(text: 'suspendu'),
                          style: TextStyle(color: Colors.white),
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
                            fillColor: Colors.orange,
                          ),
                        )),
                  ],
                )
              ],
            ),
          );
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
    if (mounted) {
      setState(() {
        userStatus = responseJson['disabled'];
      });
    }

    //responseJson.map((m) => usersState.add(userSatatus.fromJson(m))).toList();
    return userSatatus.fromJson(jsonDecode(response.body));
  }
}
