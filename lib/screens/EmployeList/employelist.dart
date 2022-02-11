import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mobile_app/flutter-icons/plus_slim_2.dart';
import 'package:mobile_app/models/employees.dart';
import 'package:mobile_app/screens/EmployeList/components/edit_employee_card.dart';
import 'package:mobile_app/screens/EmployeList/components/employee_card.dart';
import 'package:mobile_app/screens/Home/skeleton/constants.dart';
import 'package:mobile_app/screens/Home/skeleton/skeleton_edit_emp.dart';
import 'package:mobile_app/screens/NewUser/new_user.dart';
import 'package:recase/recase.dart';

class ListViewHome extends StatefulWidget {
  const ListViewHome({Key? key}) : super(key: key);

  @override
  State<ListViewHome> createState() => _ListViewHomeState();
}

class _ListViewHomeState extends State<ListViewHome> {
  bool edit = false;
  Icon customIcon = const Icon(Icons.search, color: Colors.blue);
  Widget customSearchBar = const Text('My Personal Journal');

  bool titleNew = false;

  String firstname = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 0,
            title: (titleNew)
                ? customSearchBar
                : Row(
                    children: [
                      const Text(
                        "Employée List",
                        style: TextStyle(color: Colors.black),
                      ),
                      IconButton(
                        padding: const EdgeInsets.fromLTRB(2.6, 3, 0, 0),
                        icon: customIcon,
                        onPressed: () {
                          setState(() {
                            if (customIcon.icon == Icons.search) {
                              // Perform set of instructions.
                              customIcon = const Icon(
                                Icons.cancel,
                                color: Colors.blue,
                              );
                              customSearchBar = ListTile(
                                leading: Icon(
                                  Icons.search,
                                  color: Colors.blue,
                                  size: 28,
                                ),
                                title: TextField(
                                  onChanged: (value) {
                                    if (value == '') {
                                      setState(() {
                                        firstname = value;
                                      });
                                    } else {
                                      setState(() {
                                        ReCase sample = ReCase(value);
                                        firstname = sample.titleCase;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'search employee',
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              );
                              setState(() {
                                titleNew = true;
                              });
                            }
                          });
                        },
                      ),
                    ],
                  ),
            elevation: 0,
            bottomOpacity: 0.0,
            backgroundColor: Colors.white,
            actions: (customIcon.icon == Icons.search)
                ? <Widget>[
                    Container(
                      child: (!edit)
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  edit = true;
                                });
                              },
                              icon: const Icon(
                                IconlyBold.more_circle,
                                color: Color.fromARGB(255, 87, 186, 70),
                              ))
                          : const SizedBox(),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NewUser()));
                        },
                        padding: const EdgeInsets.fromLTRB(0, 2.2, 0, 0),
                        icon: const Icon(
                          PlusSlim2.plus_circled,
                          color: Color.fromARGB(255, 87, 186, 70),
                        ))
                  ]
                : <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          customIcon = const Icon(
                            Icons.search,
                            color: Colors.blue,
                          );
                          titleNew = false;
                          firstname = '';
                        });
                      },
                      icon: customIcon,
                    )
                  ]),
        body: Column(
          children: [
            (!edit)
                ? Expanded(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .where('name', isGreaterThanOrEqualTo: firstname)
                          .where('name', isLessThan: firstname + 'z')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: ListView.separated(
                              itemCount: 15,
                              itemBuilder: (context, index) =>
                                  const NewsCardSkeltonEditEmp(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: defaultPadding),
                            ),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs.map((document) {
                            return EmployeeCard(
                              employee: Employee(
                                  uid: document.id,
                                  image: document['Image'],
                                  name: document['name'],
                                  job: document['job']),
                              press: () {},
                            );
                          }).toList(),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .where('name', isGreaterThanOrEqualTo: firstname)
                          .where('name', isLessThan: firstname + 'z')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs.map((document) {
                            return EditEmployeeCard(
                              employee: Employee(
                                  uid: document.id,
                                  image: document['Image'],
                                  name: document['name'],
                                  job: document['job']),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
          ],
        ));
  }
}
