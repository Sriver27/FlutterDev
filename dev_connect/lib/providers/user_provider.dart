import 'package:dev_connect/models/user.dart';
import 'package:dev_connect/resources/auth_methods.dart';
import 'package:flutter/material.dart';

class userProvider extends ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();
  User get getUser => _user!;
  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
