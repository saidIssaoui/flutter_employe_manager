import 'package:flutter/material.dart';
import 'package:mobile_app/components/rounded_button_disable.dart';
import 'package:mobile_app/screens/Navbar/bottom_nav_bar.dart';
import 'package:mobile_app/services/auth.dart';

class CustomDialogDisable extends StatefulWidget {
  CustomDialogDisable({Key? key, required this.uid, required this.fullname})
      : super(key: key);

  final uid;
  final fullname;
  final AuthService _auth = AuthService();
  @override
  State<CustomDialogDisable> createState() => _CustomDialogDisableState();
}

class _CustomDialogDisableState extends State<CustomDialogDisable> {
  bool circle = false;

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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  children: [
                    (!circle)
                        ? Positioned(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Align(
                                alignment: Alignment.topRight,
                                child: CircleAvatar(
                                    radius: 10.0,
                                    backgroundColor: Colors.blue,
                                    child: CircleAvatar(
                                      radius: 9.5,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.blue,
                                        size: 14,
                                      ),
                                    )),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
                (!circle)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Êtes-vous sûr de suspendre " + widget.fullname,
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedButtonDisable(
                                text: "Confirmer",
                                press: () async {
                                  setState(() {
                                    circle = true;
                                  });
                                  await widget._auth
                                      .disableUser(widget.uid, true);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          MyHomePage(
                                        counterindex: 1,
                                      ),
                                    ),
                                  );
                                },
                                color: Colors.orange,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              RoundedButtonDisable(
                                color: Colors.red,
                                text: "Annuler",
                                press: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                          color: Colors.orange,
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
