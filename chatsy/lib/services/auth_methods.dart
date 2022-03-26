import 'dart:io';
import 'dart:typed_data';

import 'package:chatsy/services/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatsy/models/user.dart' as model;
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
    required XFile file,
  }) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          file != null) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //     .then((value) {
        //   FirebaseAuth.instance.currentUser!.updateDisplayName(username);

        // });
        User userprof = cred.user!;
        userprof.updateDisplayName(username);

        //add user to database
        print(file.path);
        final String photoUrl = await storageMethods().uploadImagetoStorage(
          'profilePics',
          file,
        );

        model.User user = model.User(
          name: username,
          id: cred.user!.uid,
          email: email,
          dp: photoUrl,
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
