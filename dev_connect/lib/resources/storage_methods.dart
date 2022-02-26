import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class storageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> uploadImagetoStorage(
      String childName, Uint8List file, bool isPost) async {
    Reference ref = _storage
        .ref() /*pointer to the file in our storage*/ .child(childName)
        .child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref
        .putData(file); //we have the authority to how the file will be stored
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
