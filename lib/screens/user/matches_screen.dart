import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newtinder/constants.dart';
import 'package:newtinder/widgets/buttons/button_colorful.dart';

class MatchesScreen extends StatefulWidget {
  @override
  _MatchesScreenState createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  bool isTinderGold = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: usersDb.where('likes', arrayContains: user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot> users = snapshot.data.docs.toList();
          return Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      'Matches',
                      style: TextStyle(
                        fontSize: 16,
                        color: tinderRed,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: MediaQuery.of(context).size.width * 0.2),
                    child: Text(
                      'Upgrade to Gold to see people who have already liked you.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      users[index].data()['profilePic'],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: isTinderGold ? 0 : 3,
                                  sigmaY: isTinderGold ? 0 : 3,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                    child: ButtonColorful(
                      onPressed: () {
                        setState(() {
                          isTinderGold = !isTinderGold;
                        });
                      },
                      title: 'See who likes you',
                      elevation: 2,
                      colors: [
                        tinderGold,
                        tinderGoldLight,
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        }
        return Material(child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
