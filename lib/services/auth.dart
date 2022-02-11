import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobile_app/models/sheck_Satutus.dart';
import 'package:mobile_app/models/task_model.dart'; // For File Upload To Firestore
// For Image Picker

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String url = '';

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(
      String email,
      String password,
      String firstname,
      String lastname,
      String username,
      String role,
      String job,
      String nsa,
      String phone,
      String whatsapp,
      String adress,
      String hourRate,
      PickedFile? image,
      String paymentType,
      String rib,
      String paypalMail) async {
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('image' + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(File(image!.path));
    var dowurl = await (await uploadTask).ref.getDownloadURL();
    url = dowurl.toString();
    await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
      'uid': user?.uid,
      'name': firstname + ' ' + lastname,
      'userName': username,
      'role': role,
      'job': job,
      'nsa': nsa,
      'phone': phone,
      'whatsApp': whatsapp,
      'adress': adress,
      'houRate': hourRate,
      'Image': url,
      'paymentType': paymentType,
      'rib': rib,
      'paypalMail': paypalMail
    });
    return true;
  }

//update with firestore
  Future updateUsers(
      String firstname,
      String lastname,
      String username,
      String role,
      String job,
      String nsa,
      String phone,
      String whatsapp,
      String adress,
      String hourRate,
      XFile? image,
      String paymentType,
      String rib,
      String paypalMail,
      String uid,
      String imagedata) async {
    if (image == null) {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'name': firstname + ' ' + lastname,
        'userName': username,
        'role': role,
        'job': job,
        'nsa': nsa,
        'phone': phone,
        'whatsApp': whatsapp,
        'adress': adress,
        'houRate': hourRate,
        'paymentType': paymentType,
        'rib': rib,
        'paypalMail': paypalMail
      });
    } else {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference photoRef = FirebaseStorage.instance.refFromURL(imagedata);

      Reference ref = storage.ref().child('image' + DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(File(image.path));
      var dowurl = await (await uploadTask).ref.getDownloadURL();
      url = dowurl.toString();
      await photoRef.delete().then((value) {});
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'name': firstname + ' ' + lastname,
        'userName': username,
        'role': role,
        'job': job,
        'nsa': nsa,
        'phone': phone,
        'whatsApp': whatsapp,
        'adress': adress,
        'houRate': hourRate,
        'Image': url,
        'paymentType': paymentType,
        'rib': rib,
        'paypalMail': paypalMail
      });
    }

    return true;
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      return null;
    }
  }

//Disable User
  Future<http.Response> disableUser(String uid, bool disabled) {
    return http.put(
      Uri.parse(
          'http://192.168.1.29:5001/fluttermap01-335114/us-central1/app/api/disableUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'uid': uid,
        'disabled': disabled,
      }),
    );
  }

//Enble User
  Future<http.Response> enableUser(String uid, bool disabled) {
    return http.put(
      Uri.parse(
          'http://192.168.1.29:5001/fluttermap01-335114/us-central1/app/api/enableUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'uid': uid,
        'disabled': disabled,
      }),
    );
  }

  //delete User
  Future<http.Response> deleteUser(String uid) {
    return http.delete(
      Uri.parse(
          'http://192.168.1.29:5001/fluttermap01-335114/us-central1/app/api/deleteOneUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'uid': uid,
      }),
    );
  }

  List<userSatatus> usersState = [];
  //Get User
  Future<userSatatus> getUser(String uid) async {
    final response = await http.get(
      Uri.parse(
          'http://192.168.1.29:5001/fluttermap01-335114/us-central1/app/api/getUserbyId/' +
              uid),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    // If the server did return a 200 OK response,
    // then parse the JSON.
    List responseJson = json.decode(response.body);
    responseJson
        .map((m) => usersState.add(new userSatatus.fromJson(m)))
        .toList();
    return userSatatus.fromJson(jsonDecode(response.body));
  }

  //Update Progress User

}
