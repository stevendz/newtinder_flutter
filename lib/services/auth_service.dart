import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signInWithPhone(context) async {
    Completer<bool> completer = Completer<bool>();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+494567890925',
      timeout: Duration(seconds: 10),
      verificationCompleted: (PhoneAuthCredential credential) async =>
          await FirebaseAuth.instance.signInWithCredential(credential),
      verificationFailed: (FirebaseAuthException error) =>
          print(error.toString().toUpperCase()),
      codeSent: (String verificationId, int resendToken) async {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('enter code'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () async {
                    PhoneAuthCredential phoneAuthCredential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationId, smsCode: '123456');
                    await FirebaseAuth.instance
                        .signInWithCredential(phoneAuthCredential);
                    Navigator.pop(context);
                    completer.complete(true);
                  },
                  child: Text('enter'),
                ),
              ],
            );
          },
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return completer.future;
  }
}
