import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class storageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> uploadImagetoStorage(
      String childName, XFile file, bool isPost) async {
    Reference ref = _storage
        .ref() /*pointer to the file in our storage*/ .child(childName)
        .child(_auth.currentUser!.uid);

    if (isPost) {
      var id = const Uuid().v1();
      ref = ref.child(id);
    }
    final _imgFileInBytes = await file.readAsBytes();
    UploadTask uploadTask = ref.putData(
        _imgFileInBytes); //we have the authority to how the file will be stored
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
