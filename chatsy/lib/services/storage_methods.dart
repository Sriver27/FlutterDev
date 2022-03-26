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
    String childName,
    XFile file,
  ) async {
    final ref = _storage.ref().child(childName).child(_auth.currentUser!.uid);
    ;

    final _file = File(file.path);
    await ref.putFile(_file);
    return await ref.getDownloadURL();
  }
}
// 