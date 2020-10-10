import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newtinder/provider/current_user.dart';
import 'package:newtinder/screens/onboarding/onboarding_add_photos_screen.dart';
import 'package:newtinder/widgets/buttons/button_border_selector.dart';
import 'package:newtinder/widgets/buttons/button_colorful.dart';
import 'package:provider/provider.dart';

class OnboardingGenderScreen extends StatefulWidget {
  @override
  _OnboardingGenderScreenState createState() => _OnboardingGenderScreenState();
}

class _OnboardingGenderScreenState extends State<OnboardingGenderScreen> {
  String gender;

  @override
  Widget build(BuildContext context) {
    CurrentUser userData = Provider.of<CurrentUser>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            height: 25,
            color: Colors.blueGrey.shade100,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 35, right: 35, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'I am a',
              style: TextStyle(color: Colors.blueGrey.shade800, fontSize: 50),
            ),
            Column(
              children: [
                ButtonBorderSelector(
                  value: 'woman',
                  currentValue: gender,
                  setSelected: setGender,
                ),
                ButtonBorderSelector(
                  value: 'man',
                  currentValue: gender,
                  setSelected: setGender,
                ),
              ],
            ),
            ButtonColorful(
              title: 'Continue',
              onPressed: gender != null
                  ? () {
                      userData.userGender = gender;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingAddPhotosScreen(),
                        ),
                      );
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  void setGender(newGender) {
    setState(() {
      gender = newGender;
    });
  }
}
