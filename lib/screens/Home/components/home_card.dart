import 'package:flutter/material.dart';
import 'package:mobile_app/flutter-icons/dot.dart';
import 'package:mobile_app/models/employees.dart';
import 'package:mobile_app/models/task_model.dart';
import 'package:mobile_app/screens/Addtask/task.dart';

import '../../../constants.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.home,
    required this.press,
  }) : super(key: key);

  final TaskModel home;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TaskInfo(uid: home.uid, image: home.avatar)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(home.avatar),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      home.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        home.job,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (home.status == 'done')
              SizedBox(
                  width: 100,
                  height: 32,
                  child: TextField(
                    enabled: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Dot.primitive_dot,
                        size: 20,
                        color: Colors.white,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                            style: BorderStyle.none),
                      ),
                      filled: true,
                      hintStyle:
                          const TextStyle(color: Colors.white, fontSize: 12),
                      hintText: home.taskNumber.toString(),
                      fillColor: const Color(0xFF57ba46),
                    ),
                  ))
            else if (home.status == 'in progress')
              SizedBox(
                  width: 100,
                  height: 32,
                  child: TextField(
                    enabled: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Dot.primitive_dot,
                        size: 20,
                        color: Colors.white,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                            style: BorderStyle.none),
                      ),
                      filled: true,
                      hintStyle:
                          const TextStyle(color: Colors.white, fontSize: 12),
                      hintText: home.taskNumber.toString(),
                      fillColor: Colors.orange,
                    ),
                  ))
            else if (home.status == 'not finished')
              SizedBox(
                  width: 100,
                  height: 32,
                  child: TextField(
                    enabled: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Dot.primitive_dot,
                        size: 20,
                        color: Colors.white,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                            style: BorderStyle.none),
                      ),
                      filled: true,
                      hintStyle:
                          const TextStyle(color: Colors.white, fontSize: 12),
                      hintText: home.taskNumber.toString(),
                      fillColor: Colors.red,
                    ),
                  ))
            else if (home.status == 'not started')
              SizedBox(
                  width: 100,
                  height: 32,
                  child: TextField(
                    enabled: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Dot.primitive_dot,
                        size: 20,
                        color: Colors.white,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                            style: BorderStyle.none),
                      ),
                      filled: true,
                      hintStyle:
                          const TextStyle(color: Colors.white, fontSize: 12),
                      hintText: home.taskNumber.toString(),
                      fillColor: Colors.grey,
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
