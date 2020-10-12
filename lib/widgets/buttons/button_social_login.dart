import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newtinder/screens/home_screen.dart';
import 'package:newtinder/screens/onboarding/onboarding_houserules_screen.dart';
import 'package:newtinder/services/auth_service.dart';

class ButtonSocialLogin extends StatefulWidget {
  final String social;
  const ButtonSocialLogin({
    Key key,
    @required this.social,
  }) : super(key: key);

  static const Map<String, String> buttonText = {
    'google': 'Login with Google',
    'phone': 'Login with Phonenumber',
  };

  static const Map<String, String> buttonIcon = {
    'google': 'assets/icons/google.svg',
    'phone': 'assets/icons/phone.svg',
  };

  @override
  _ButtonSocialLoginState createState() => _ButtonSocialLoginState();
}

class _ButtonSocialLoginState extends State<ButtonSocialLogin> {
  CollectionReference userDb = FirebaseFirestore.instance.collection("users");

  Future<void> onButtonPressed(context) async {
    switch (widget.social) {
      case 'google':
        await AuthService().signInWithGoogle();
        forwardWithUser();
        break;
      case 'phone':
        await AuthService().signInWithPhone(context);
        forwardWithUser();
        break;
    }
  }

  Future<void> forwardWithUser() async {
    if (FirebaseAuth.instance.currentUser != null) {
      DocumentSnapshot data =
          await userDb.doc(FirebaseAuth.instance.currentUser.uid).get();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              data.exists ? HomeScreen() : OnboardingHouseRulesScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      onPressed: () async {
        onButtonPressed(context);
      },
      child: Center(
        child: Row(
          children: [
            SvgPicture.asset(
              ButtonSocialLogin.buttonIcon[widget.social],
              height: 25,
            ),
            Expanded(
              child: Text(
                ButtonSocialLogin.buttonText[widget.social].toUpperCase(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
