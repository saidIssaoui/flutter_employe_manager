import 'package:flutter/material.dart';
import 'package:mobile_app/components/rounded_button_Add_comment.dart';
import 'package:mobile_app/flutter-icons/check_circle.dart';

class CustomDialogCommentSent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      elevation: 0.0,
      backgroundColor: const Color(0xfff0f2f0),
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
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04),
            decoration: BoxDecoration(
                color: const Color(0xfff0f2f0),
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
              children: <Widget>[
                const Icon(
                  CheckCircle.check_circle,
                  color: Color.fromARGB(255, 20, 211, 3),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Reparation des pc fixe et imprimants",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Commentaire Envoyée",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black38),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 160,
                  padding: const EdgeInsets.all(5),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextField(
                          cursorColor: Colors.black,
                          maxLines: 8,
                          decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 12),
                              hintText:
                                  "Graphic design is a craft where professionals create visual content to communicate messages. By applying visual hierarchy and page layout techniques, designers use typography and pictures to meet users' specific needs and focus on the logic of displaying elements in interactive designs, to optimize the user experience.",
                              enabled: false),
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black)),
                    ],
                  ),
                ),
                RoundedButtonAddComment(
                  text: "Done",
                  press: () {
                    Navigator.of(context).pop();
                  },
                ), //
              ],
            ),
          ),
        ],
      ),
    );
  }
}
