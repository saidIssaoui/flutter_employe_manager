import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/components/rounded_button_Add.dart';
import 'package:mobile_app/components/rounded_image_field_update.dart';
import 'package:mobile_app/components/rounded_input_name_edit_field.dart';
import 'package:mobile_app/components/rounded_mail_update_field.dart';
import 'package:mobile_app/screens/NewUser/components/dialog_progress_circle.dart';
import 'package:mobile_app/screens/profile/hero_dialog_route.dart';
import 'package:mobile_app/services/auth.dart';
import 'package:recase/recase.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({Key? key, required this.uid}) : super(key: key);

  final uid;

  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  @override
  XFile? imageFile;

  bool imageExist = false;

  String firstname = '';

  String lastname = '';

  String username = '';

  String role = '';

  String nsa = '';

  String phone = '';

  String whatsapp = '';

  String adress = '';

  String hourRate = '';

  String rib = '';

  String paymentType = '';

  String paypalMail = '';

  bool notValid = false;

  bool notPasswordValid = false;

  bool passchanged = false;

  bool notValidpaypal = false;

  bool allincorrect = false;

  String job = '';

  String test = '';

  var status;
  String? itemSelected;
  var items = [
    'user',
    'admin',
  ];

  var image;

  bool circle = false;

  String name = '';
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    //  lunchProgressCircle();
    return Scaffold(
        backgroundColor: const Color(0xfff0f2f0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                backgroundColor: const Color(0xfff0f2f0),
                centerTitle: false,
                title: const Text(
                  "Mettre a jour utilisateur",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedInptNameEditField(
                    controller: firstname,
                    hintText: 'Nom',
                    onChanged: (value) {
                      ReCase sample = ReCase(value);
                      firstname = sample.sentenceCase;
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  RoundedInptNameEditField(
                    controller: lastname,
                    hintText: 'Prénom',
                    onChanged: (value) {
                      ReCase sample = ReCase(value);
                      lastname = sample.sentenceCase;
                    },
                  ),
                ],
              ),
              RoundedMailUpdateField(
                  controller: username,
                  onChanged: (value) {
                    username = value;
                  },
                  hintText: " Nom d'Utilisateur",
                  icon: const Icon(IconlyBold.profile),
                  color: Colors.grey),
              // RoundedMailUpdateField(
              //   controller: role,
              //   onChanged: (value) {
              //     role = value;
              //   },
              //   hintText: "Role d'Utilisateur",
              //   icon: const Icon(IconlyLight.arrow_down_circle),
              //   color: Colors.grey,
              // ),
              dropDownButtonsColumn(
                items,
                "Role d'Utilisateur",
              ),
              RoundedMailUpdateField(
                controller: job,
                onChanged: (value) {
                  job = value;
                },
                hintText: "Métier d'Utilisateur",
                icon: const Icon(IconlyLight.work),
                color: Colors.grey,
              ),
              RoundedMailUpdateField(
                controller: nsa,
                onChanged: (value) {
                  nsa = value;
                },
                hintText: "NAS",
                icon: const Icon(null),
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedInptNameEditField(
                    controller: phone,
                    hintText: 'Numero Mobile',
                    onChanged: (value) {
                      phone = value;
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  RoundedInptNameEditField(
                    controller: whatsapp,
                    hintText: 'Whatsapp',
                    onChanged: (value) {
                      whatsapp = value;
                    },
                  ),
                ],
              ),
              RoundedMailUpdateField(
                controller: adress,
                onChanged: (value) {
                  adress = value;
                },
                hintText: "Addresse",
                icon: const Icon(IconlyLight.location),
                color: Colors.grey,
              ),
              RoundedMailUpdateField(
                controller: hourRate,
                onChanged: (value) {
                  hourRate = value;
                },
                hintText: "Taux Horaire",
                icon: Container(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.030, 4, 0, 0),
                  child: const Text(
                    "\$",
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                ),
                color: Colors.grey,
              ),
              RoundedImageFieldUpdate(
                image: image,
                onChanged: (value) {},
                hintText: (!imageExist)
                    ? "Changer Image →"
                    : imageFile?.path.toString(),
                icon: IconButton(
                    onPressed: () async => {_showChoiceDialog(context)},
                    icon: const Icon(IconlyLight.upload)),
                color: Colors.grey,
              ),
              RoundedMailUpdateField(
                controller: username,
                onChanged: (value) {
                  paymentType = value;
                },
                hintText: "Methode de Paiement",
                icon: const Icon(IconlyLight.arrow_down_circle),
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedInptNameEditField(
                    controller: rib,
                    hintText: 'RIB',
                    onChanged: (value) {
                      rib = value;
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  RoundedInptNameEditField(
                    controller: paypalMail,
                    hintText: 'Paypal Email',
                    onChanged: (value) {
                      paypalMail = value;
                      setState(() {
                        notValidpaypal = !isValidEmail(value);
                      });
                    },
                  ),
                ],
              ),
              if (notValidpaypal)
                const SizedBox(
                    child: Text('Email invalide',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.red))),
              if (allincorrect)
                const SizedBox(
                    child: Text('vérifier vos informations',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.red))),
              RoundedButtonAdd(
                text: "Mise A Jour",
                press: () async {
                  if (itemSelected != null && !notValidpaypal) {
                    Navigator.push(context, HeroDialogRoute(builder: (context) {
                      return CustomDialogProgressCircle();
                    }));
                    await AuthService().updateUsers(
                        firstname,
                        lastname,
                        username,
                        itemSelected!,
                        job,
                        nsa,
                        phone,
                        whatsapp,
                        adress,
                        hourRate,
                        imageFile,
                        paymentType,
                        rib,
                        paypalMail,
                        widget.uid,
                        image);
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
        ));
  }

  // lunchProgressCircle() {
  //   if (circle) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => CustomDialogProgressCircle(
  //                   circle: circle,
  //                 )));
  //   }
  //   ;
  // }

  dropDownButtonsColumn(List<String> list, String hint) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 45, //gives the height of the dropdown button
        width: MediaQuery.of(context).size.width *
            0.9, //gives the width of the dropdown button
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Colors.white),
        // padding: const EdgeInsets.symmetric(horizontal: 13), //you can include padding to control the menu items
        child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor:
                    Colors.white, // background color for the dropdown items
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown:
                      true, //If false (the default), then the dropdown's menu will be wider than its button.
                )),
            child: DropdownButtonHideUnderline(
              // to hide the default underline of the dropdown button
              child: DropdownButton<String>(
                icon: const Icon(
                  IconlyLight.arrow_down_circle,
                ),
                iconEnabledColor: const Color(
                    0xFF595959), // icon color of the dropdown button
                items: list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 15),
                    ),
                  );
                }).toList(),
                hint: Text(
                  hint,
                  style:
                      const TextStyle(color: Color(0xFF8B8B8B), fontSize: 15),
                ), // setting hint
                onChanged: (String? value) {
                  setState(() {
                    itemSelected = value; // saving the selected value
                  });
                },
                value: itemSelected, // displaying the selected value
              ),
            )),
      ),
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Choisir option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: const Text("Gallery"),
                    leading: const Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: const Text("Camera"),
                    leading: const Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _loadData() async {
    var coll = FirebaseFirestore.instance.collection('users');
    var qs = await coll.doc(widget.uid).get();
    Map<String, dynamic>? value = qs.data();

    setState(() {
      whatsapp = value!['whatsApp'];
      name = value['name'];
      role = value['role'];
      hourRate = value['houRate'];
      phone = value['phone'];
      paypalMail = value['paypalMail'];
      job = value['job'];
      nsa = value['nsa'];
      username = value['userName'];
      image = value['Image'];
      adress = value['adress'];
      rib = value['rib'];
      status = value['status'];
      itemSelected = value['role'];
      firstname = name.split(' ')[0];
      lastname = name.split(' ')[1];
    });
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageExist = true;
      imageFile = pickedFile;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageExist = true;
      imageFile = pickedFile;
    });
    Navigator.pop(context);
  }

  bool isValidEmail(email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  // bool validatePassword(value) {
  //   String pattern =
  //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  //   RegExp regExp = new RegExp(pattern);
  //   return regExp.hasMatch(value);
  // }
}
