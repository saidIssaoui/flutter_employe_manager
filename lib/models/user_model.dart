import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class UserModel {
  final String id;
  final String? job;
  final String name;
  final String? avatar;

  List<Object?> allData = [];

  //static var list;
  UserModel(
      {required this.id, required this.job, required this.name, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["uid"],
      job: json["job"],
      name: json["name"],
      avatar: json["Image"],
    );
  }

  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  bool? userFilterByCreationDate(String filter) {
    return job?.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel? model) {
    return this.id == model?.id;
  }

  @override
  String toString() => name;
}
