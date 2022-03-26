import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.dp,
    this.status = "Unavailable",
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      dp: data['dp'],
      status: data['status'],
    );
  }

  final String id;
  final String name;
  final String email;
  final String dp;
  final String status;

  Map<String, dynamic> toJson() => {
        'username': name,
        'uid': id,
        'email': email,
        'photoUrl': dp,
        'status': status,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = (snap.data() as Map<String, dynamic>);
    return User(
        name: snapshot['username'] ?? "null",
        id: snapshot['id'] ?? "null",
        email: snapshot['email'] ?? "null",
        dp: snapshot['dp'] ?? "null",
        status: snapshot['status'] ?? "Unavailable");
  }
}
