import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_connect/resources/storage_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dev_connect/models/user.dart' as model;
import 'package:image_picker/image_picker.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String collegename,
    required XFile? file,
  }) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          collegename.isNotEmpty ||
          file != null) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //add user to database
        String photoUrl = await storageMethods()
            .uploadImagetoStorage('profilePics', file!, false);

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          collegeName: collegename,
          followers: [],
          following: [],
          photoUrl: photoUrl,
        );
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "Success";
      } else {
        res = "Please enter all the feilds";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Success";
      } else {
        res = "Please enter all the feilds";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
