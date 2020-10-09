import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'newTinder',
              home: SplashScreen(),
            );
          }
          return Material(child: Center(child: CircularProgressIndicator()));
        });
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User user = FirebaseAuth.instance.currentUser;

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    setState(() {
      this.user = FirebaseAuth.instance.currentUser;
    });
  }

  Future<void> signInWithPhone(verificationId) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: '123456');
    await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
    setState(() {
      user = FirebaseAuth.instance.currentUser;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: signInWithGoogle, child: Text('Login with Google')),
            FlatButton(
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: '+494567890925',
                  timeout: Duration(seconds: 10),
                  verificationCompleted:
                      (PhoneAuthCredential credential) async =>
                          await FirebaseAuth.instance
                              .signInWithCredential(credential),
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
                                await signInWithPhone(verificationId);
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
              },
              child: Text('Login with Phone'),
            ),
            Text(user.toString()),
            FlatButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                setState(() {
                  user = FirebaseAuth.instance.currentUser;
                });
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
