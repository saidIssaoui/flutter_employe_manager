import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mobile_app/models/employees.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/models/sheck_Satutus.dart';
import 'dart:convert';

import '../../../constants.dart';

class EmployeeCard extends StatefulWidget {
  const EmployeeCard({
    Key? key,
    required this.employee,
    required this.press,
  }) : super(key: key);

  final Employee employee;
  final VoidCallback press;

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  bool userStatus = false;
  @override
  void initState() {
    getUser(widget.employee.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (!userStatus)
        ? InkWell(
            onTap: widget.press,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding * 0.75),
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(widget.employee.image),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.employee.name +
                                ' ' +
                                widget.employee.lastname,
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
                  const Icon(
                    IconlyBold.arrow_left_circle,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          )
        : Opacity(
            opacity: 0.5,
            child: InkWell(
              onTap: widget.press,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding * 0.75),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(widget.employee.image),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.employee.name +
                                  ' ' +
                                  widget.employee.lastname,
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
                    const Icon(
                      IconlyBold.arrow_left_circle,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ));
  }

  Future<userSatatus> getUser(String uid) async {
    final response = await http.get(
      Uri.parse(
          'http://192.168.1.29:5001/fluttermap01-335114/us-central1/app/api/getUserbyId/' +
              uid),
    );

    // If the server did return a 200 OK response,
    // then parse the JSON.
    Map<String, dynamic> responseJson = jsonDecode(response.body);
    if (mounted) {
      setState(() {
        userStatus = responseJson['disabled'];
      });
    }

    return userSatatus.fromJson(jsonDecode(response.body));
  }
}
