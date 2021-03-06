import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newtinder/screens/onboarding/onboarding_first_name_screen.dart';
import 'package:newtinder/screens/splash_screen.dart';
import 'package:newtinder/widgets/buttons/button_colorful.dart';
import 'package:newtinder/widgets/onboarding/house_rule.dart';
import 'package:newtinder/widgets/onboarding/house_rules_header.dart';

class OnboardingHouseRulesScreen extends StatefulWidget {
  @override
  _OnboardingHouseRulesScreenState createState() =>
      _OnboardingHouseRulesScreenState();
}

class _OnboardingHouseRulesScreenState
    extends State<OnboardingHouseRulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/cancel.svg',
            height: 25,
            color: Colors.blueGrey.shade100,
          ),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SplashScreen(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 35, right: 35, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HouseRulesHeader(),
            HouseRule(rule: 'Be yourself.'),
            HouseRule(rule: 'Stay safe.'),
            HouseRule(rule: 'Play it cool.'),
            HouseRule(rule: 'Be proactive.'),
            ButtonColorful(
              title: 'I agree',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnboardingFirstNameScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
