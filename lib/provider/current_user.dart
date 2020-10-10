import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  String _userUid;
  String _userName;
  String _userGender;
  List<String> _userPhotos = [];

  String get userUid => _userUid;
  String get userName => _userName;
  String get userGender => _userGender;
  List get userPhotos => _userPhotos;

  set userName(newName) {
    _userName = newName;
    notifyListeners();
  }

  set userGender(newGender) {
    _userGender = newGender;
    notifyListeners();
  }

  set userPhotos(newPhotos) {
    _userPhotos = newPhotos;
    notifyListeners();
  }

  void setUser() {
    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _userUid = user.uid;
    } else {
      _userUid = null;
    }
    notifyListeners();
  }
}
