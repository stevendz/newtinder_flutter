import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newtinder/screens/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference userDb = FirebaseFirestore.instance.collection("users");
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userDb.doc(user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData) {
          var data = snapshot.data.data();
          return Scaffold(
            body: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(data['avatar']),
                ),
                Text(data['username']),
                Text(data['gender']),
                IconButton(
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
              ],
            ),
          );
        }
        return Material(child: Center(child: Text("loading...")));
      },
    );
  }
}
