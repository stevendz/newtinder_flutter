import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtinder/card/swipeable_card.dart';
import 'package:newtinder/card/swipeable_widget.dart';
import 'package:newtinder/screens/user/chat_screen.dart';
import 'package:newtinder/widgets/swipe/swipe_actions_row.dart';
import 'package:newtinder/widgets/swipe/swipe_section.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({
    Key key,
  }) : super(key: key);

  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

final List<SwipeableCard> cards = [];

class _SwipeScreenState extends State<SwipeScreen> {
  CollectionReference chatsDb = FirebaseFirestore.instance.collection("chats");
  CollectionReference userDb = FirebaseFirestore.instance.collection("users");
  SwipeableWidgetController _cardController = SwipeableWidgetController();
  User user = FirebaseAuth.instance.currentUser;
  int currentCardIndex = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: userDb.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot> userData = snapshot.data.docs.toList();

          return SafeArea(
            child: Column(
              children: [
                SwipeSection(
                  userData: userData,
                  cardController: _cardController,
                  currentCardIndex: currentCardIndex,
                  swipeLeft: swipeLeft,
                  swipeRight: swipeRight,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SwipeActionsRow(cardController: _cardController),
                )
              ],
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  void swipeLeft(uid) {
    print("card swiped to the left");
    setState(() {
      currentCardIndex++;
    });
  }

  void swipeRight(uid) async {
    userDb.doc(user.uid).update({
      'likes': FieldValue.arrayUnion([uid])
    });
    DocumentSnapshot possibleMatch = await userDb.doc(uid).get();
    bool match;
    if (possibleMatch.data()['likes'].length != null)
      match = possibleMatch.data()['likes'].any((like) {
        return like == user.uid;
      });

    print(match);
    // var matches = possibleMatch.data()['likes'].where((element) {
    //   return myLikes.any((like) => like == element.id);
    // });
    if (match)
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Match'),
            content: Text(possibleMatch.data()['username']),
            actions: [
              FlatButton(
                onPressed: () {
                  chatsDb.add({
                    'members': [user.uid, uid]
                  }).then(
                    (value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          chatId: value.id,
                          chatPartnerUid: uid,
                        ),
                      ),
                    ),
                  );
                },
                child: Text('Say hello'),
              ),
            ],
          );
        },
      );
    setState(() {
      currentCardIndex++;
    });
  }
}
