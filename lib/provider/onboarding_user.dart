import 'package:flutter/material.dart';

class OnboardingUser extends ChangeNotifier {
  String _userName;
  String _userGender;
  List<String> _userPhotos = [];

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
}
