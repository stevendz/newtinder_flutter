import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newtinder/provider/current_user.dart';
import 'package:newtinder/widgets/buttons/button_colorful.dart';
import 'package:newtinder/widgets/onboarding/house_rule.dart';
import 'package:newtinder/widgets/onboarding/house_rules_header.dart';
import 'package:provider/provider.dart';

class OnboardingHouseRulesScreen extends StatelessWidget {
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
              color: Colors.blueGrey,
            ),
            onPressed: () {}),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
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
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Provider.of<CurrentUser>(context, listen: false).setUser();
              },
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
