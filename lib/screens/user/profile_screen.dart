import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtinder/widgets/clipper/circular_clipper.dart';
import 'package:newtinder/widgets/profile/profile_header.dart';
import 'package:newtinder/widgets/profile/profile_settings_row.dart';
import 'package:newtinder/widgets/profile/tinder_gold/get_tinder_gold.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key key,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CollectionReference userDb = FirebaseFirestore.instance.collection("users");
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: userDb.doc(user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData) {
          Map<String, dynamic> userData = snapshot.data.data();
          return Column(
            children: [
              ClipShadowPath(
                clipper: CircularClipper(),
                shadow: Shadow(
                  color: Colors.blueGrey,
                  blurRadius: 1,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileHeader(userData: userData),
                      ProfileSettingsRow(),
                    ],
                  ),
                ),
              ),
              GetTinderGold(),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
