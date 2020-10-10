import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newtinder/provider/current_user.dart';
import 'package:newtinder/screens/home_screen.dart';
import 'package:newtinder/widgets/buttons/button_colorful.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class OnboardingEnableGpsScreen extends StatefulWidget {
  @override
  _OnboardingEnableGpsScreenState createState() =>
      _OnboardingEnableGpsScreenState();
}

class _OnboardingEnableGpsScreenState extends State<OnboardingEnableGpsScreen> {
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
          children: [
            Container(),
            SvgPicture.asset('assets/icons/location.svg',
                width: MediaQuery.of(context).size.width * 0.35),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Enable Location',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blueGrey.shade800,
                ),
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'You\'ll need to enable your location in order to use Tinder',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonColorful(
              title: 'Allow location',
              onPressed: () async {
                var permisson = await Permission.location.request();
                print(permisson);
                print(FirebaseAuth.instance.currentUser);
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .set({
                  'username': userData.userName,
                  'gender': userData.userGender,
                  'avatar': FirebaseAuth.instance.currentUser.photoURL,
                  'userPhotos': userData.userPhotos
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
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
