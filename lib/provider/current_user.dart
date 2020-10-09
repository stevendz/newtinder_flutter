import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  String _userUid = 'No Users';
  String get userUid => _userUid;

  void setUser() {
    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _userUid = user.uid;
    } else {
      _userUid = 'No user';
    }
    notifyListeners();
  }
}
