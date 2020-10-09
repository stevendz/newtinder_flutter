import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtinder/provider/current_user.dart';
import 'package:newtinder/services/auth_service.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: () async {
                  await AuthService().signInWithGoogle();
                  Provider.of<CurrentUser>(context, listen: false).setUser();
                },
                child: Text('Login with Google')),
            FlatButton(
              onPressed: () async {
                await AuthService().signInWithPhone(context);
                Provider.of<CurrentUser>(context, listen: false).setUser();
              },
              child: Text('Login with Phone'),
            ),
            Text(
              Provider.of<CurrentUser>(context).userUid.toString(),
            ),
            FlatButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Provider.of<CurrentUser>(context, listen: false).setUser();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
