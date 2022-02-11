import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  String url = '';
  // collection reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(
      String email,
      String password,
      String firstname,
      String lastname,
      String username,
      String role,
      String nsa,
      String phone,
      String whatsapp,
      String adress,
      String hourRate,
      PickedFile? image,
      String paymentType,
      String rib,
      String paypalMail) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('image' + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(File(image!.path));
    var dowurl = await (await uploadTask).ref.getDownloadURL();
    url = dowurl.toString();
    return await usersCollection.doc(uid).set({
      'firstName': firstname,
      'lastName': lastname,
      'userName': username,
      'role': role,
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

  // Add Task
  Future<void> addTask(
    String uid,
    int number,
    String type,
    String employeName,
    String employeUid,
    String employeImage,
    String selectedEmployeJob,
    String nameTask,
    String client,
    String start,
    String end,
    String duration,
  ) async {
    await FirebaseFirestore.instance.collection('tasks').doc(uid).set({
      'number': number,
      'type': type,
      'employeUid': employeName,
      'employeName': employeUid,
      'employeImage': employeImage,
      'selectedEmployeJob': selectedEmployeJob,
      'nameTask': nameTask,
      'client': client,
      'start': start,
      'end': end,
      'duration': duration,
      'progress': 0.0,
      'status': 'not started',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
