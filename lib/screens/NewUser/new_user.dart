import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/components/rounded_button_Add.dart';
import 'package:mobile_app/components/rounded_image_field.dart';
import 'package:mobile_app/components/rounded_input_name_field.dart';
import 'package:mobile_app/components/rounded_mail_input.dart';
import 'package:mobile_app/screens/NewUser/components/dialog_progress_circle.dart';
import 'package:mobile_app/screens/profile/hero_dialog_route.dart';
import 'package:mobile_app/services/auth.dart';
import 'package:recase/recase.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  PickedFile? imageFile;

  bool imageExist = false;

  String firstname = '';

  String lastname = '';

  String username = '';

  String password = '';

  String role = '';

  String nsa = '';

  String phone = '';

  String whatsapp = '';

  String email = '';

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
  String? itemSelected;
  var items = [
    'user',
    'admin',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff0f2f0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                backgroundColor: const Color(0xfff0f2f0),
                centerTitle: false,
                title: const Text(
                  "Nouvel utilisateur",
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
                  RoundedInptNameField(
                    hintText: 'Nom',
                    onChanged: (value) {
                      ReCase sample = ReCase(value);
                      firstname = sample.sentenceCase;
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  RoundedInptNameField(
                    hintText: 'Prénom',
                    onChanged: (value) {
                      ReCase sample = ReCase(value);
                      lastname = sample.sentenceCase;
                    },
                  ),
                ],
              ),
              RoundedMailField(
                  onChanged: (value) {
                    username = value;
                  },
                  hintText: " Nom d'Utilisateur",
                  icon: const Icon(IconlyBold.profile),
                  color: Colors.grey),
              RoundedMailField(
                hintText: "Mot de Pass",
                icon: const Icon(IconlyLight.hide),
                color: Colors.grey,
                onChanged: (value) {
                  password = value;
                  setState(() {
                    passchanged = true;
                    notPasswordValid = !validatePassword(value);
                  });
                },
              ),
              if (notPasswordValid)
                const SizedBox(
                    child: Text(
                        'Mot de passe faible \nVotre mot de passe doit avoir au moins\nUne lettre majuscule [A-Z] \nUn caractère spécial[@^ù..]\nUn chiffre [1-9]',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)))
              else if (!notPasswordValid && passchanged)
                const SizedBox(
                    child: Text('Good Password',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.green))),
              // RoundedMailField(
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
              RoundedMailField(
                onChanged: (value) {
                  job = value;
                },
                hintText: "Métier d'Utilisateur",
                icon: const Icon(IconlyLight.work),
                color: Colors.grey,
              ),
              RoundedMailField(
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
                  RoundedInptNameField(
                    hintText: 'Numero Mobile',
                    onChanged: (value) {
                      phone = value;
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  RoundedInptNameField(
                    hintText: 'Whatsapp',
                    onChanged: (value) {
                      whatsapp = value;
                    },
                  ),
                ],
              ),
              RoundedMailField(
                onChanged: (value) {
                  email = value;
                  setState(() {
                    notValid = !isValidEmail(value);
                  });
                },
                hintText: "Email",
                icon: const Icon(Icons.alternate_email),
                color: Colors.grey,
              ),
              if (notValid)
                const SizedBox(
                    child: Text('Invalid Email',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.red))),
              RoundedMailField(
                onChanged: (value) {
                  adress = value;
                },
                hintText: "Addresse",
                icon: const Icon(IconlyLight.location),
                color: Colors.grey,
              ),
              RoundedMailField(
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
              RoundedImageField(
                image: null,
                onChanged: (value) {},
                hintText: (!imageExist)
                    ? "Choisir Image →"
                    : imageFile?.path.toString(),
                icon: IconButton(
                    onPressed: () async => {_showChoiceDialog(context)},
                    icon: const Icon(IconlyLight.upload)),
                color: Colors.grey,
              ),
              RoundedMailField(
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
                  RoundedInptNameField(
                    hintText: 'RIB',
                    onChanged: (value) {
                      rib = value;
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  RoundedInptNameField(
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
                text: "Ajouter",
                press: () async {
                  if (!notValid &&
                      !notPasswordValid &&
                      imageFile != null &&
                      itemSelected != null &&
                      !notValidpaypal) {
                    Navigator.push(context, HeroDialogRoute(builder: (context) {
                      return CustomDialogProgressCircle();
                    }));
                    await AuthService().registerWithEmailAndPassword(
                        email,
                        password,
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
                        paypalMail);
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

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageExist = true;
      imageFile = pickedFile;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
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

  bool validatePassword(value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
