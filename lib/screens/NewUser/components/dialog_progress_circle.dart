import 'package:flutter/material.dart';
import 'package:mobile_app/components/rounded_button_disable.dart';
import 'package:mobile_app/screens/EmployeList/employelist.dart';
import 'package:mobile_app/services/auth.dart';

class CustomDialogProgressCircle extends StatefulWidget {
  CustomDialogProgressCircle({
    Key? key,
  }) : super(key: key);
  @override
  State<CustomDialogProgressCircle> createState() =>
      _CustomDialogProgressCircleState();
}

class _CustomDialogProgressCircleState
    extends State<CustomDialogProgressCircle> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.15,
          right: MediaQuery.of(context).size.width * 0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 18.0,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "s'il vous plaît soyez patient",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      color: Colors.green,
                      strokeWidth: 10,
                    )),
                const SizedBox(
                  height: 20.0,
                ),

                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}
