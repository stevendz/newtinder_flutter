import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newtinder/constants.dart';
import 'package:newtinder/widgets/buttons/button_social_login.dart';
import 'package:newtinder/widgets/logo/logo_with_text.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 35),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              tinderOrange,
              tinderRed,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              alignment: Alignment.center,
              child: LogoWithText(),
            ),
            Text(
              'By clicking Log In, you agree to our Terms. Learn how we process your data in our Privacy Policy and Cookie Polilcy',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            ButtonSocialLogin(social: 'google'),
            ButtonSocialLogin(social: 'phone'),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Trouble logging in?',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
