import 'package:flutter/material.dart';
import 'package:mobile_app/components/rounded_button_Add_comment.dart';
import 'package:mobile_app/screens/Addtask/dialog_coment_sent.dart';

class CustomDialogComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(18),
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("254"),
                    RoundedButtonAddComment(
                      text: "Envoyer",
                      press: () {
                        Navigator.of(context).pop();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CustomDialogCommentSent());
                      },
                    ),
                    Stack(
                      children: [
                        Positioned(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                  radius: 14.0,
                                  backgroundColor: Colors.blue,
                                  child: CircleAvatar(
                                    radius: 12.5,
                                    backgroundColor: Colors.white,
                                    child:
                                        Icon(Icons.close, color: Colors.blue),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 160,
                  child: TextField(
                      cursorColor: Colors.black,
                      maxLines: 8,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black26, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black26, width: 1.0),
                        ),
                      ),
                      style: TextStyle(fontSize: 12.0, color: Colors.black)),
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
