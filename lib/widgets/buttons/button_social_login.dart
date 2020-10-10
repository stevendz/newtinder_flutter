import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newtinder/screens/onboarding/onboarding_houserules_screen.dart';
import 'package:newtinder/services/auth_service.dart';

class ButtonSocialLogin extends StatelessWidget {
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

  Future<void> onButtonPressed(context) async {
    switch (social) {
      case 'google':
        await AuthService().signInWithGoogle();
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OnboardingHouseRulesScreen(),
            ),
          );
        }
        break;
      case 'phone':
        await AuthService().signInWithPhone(context);
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OnboardingHouseRulesScreen(),
            ),
          );
        }
        break;
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
              buttonIcon[social],
              height: 25,
            ),
            Expanded(
              child: Text(
                buttonText[social].toUpperCase(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
