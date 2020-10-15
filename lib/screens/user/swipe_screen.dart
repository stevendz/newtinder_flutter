import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newtinder/card/swipeable_card.dart';
import 'package:newtinder/card/swipeable_widget.dart';
import 'package:newtinder/constants.dart';
import 'package:newtinder/widgets/swipe/match_dialog.dart';
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
  SwipeableWidgetController _cardController = SwipeableWidgetController();
  int currentCardIndex = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: usersDb.snapshots(),
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
                  child: SwipeActionsRow(
                    cardController: _cardController,
                  ),
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

  Future<void> swipeRight({String uid}) async {
    usersDb.doc(user.uid).update({
      'likes': FieldValue.arrayUnion([uid])
    });
    DocumentSnapshot possibleMatch = await usersDb.doc(uid).get();
    bool match;
    if (possibleMatch.data()['likes'].length != null)
      match = possibleMatch.data()['likes'].any((like) {
        return like == user.uid;
      });
    if (match)
      showDialog(
        context: context,
        builder: (context) {
          return MatchDialog(
            chatsDb: chatsDb,
            user: user,
            matchUid: uid,
          );
        },
      );
    setState(() {
      currentCardIndex++;
    });
  }
}
