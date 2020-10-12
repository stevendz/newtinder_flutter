import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtinder/screens/card/card_example.dart';
import 'package:newtinder/screens/card/swipeable_widget.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({
    Key key,
  }) : super(key: key);

  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

final List<CardExample> cards = [];

class _SwipeScreenState extends State<SwipeScreen> {
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
          // userData[index].data()['username']
          if (cards.isEmpty)
            userData.forEach((element) {
              cards.add(
                CardExample(
                  image: element.data()['profilePic'],
                  text: element.data()['username'],
                ),
              );
            });
          print(cards);
          return SafeArea(
            child: Column(
              children: [
                if (currentCardIndex < cards.length)
                  SwipeableWidget(
                    cardController: _cardController,
                    animationDuration: 500,
                    horizontalThreshold: 0.85,
                    child: cards[currentCardIndex],
                    nextCards: <Widget>[
                      if (!(currentCardIndex + 1 >= cards.length))
                        Align(
                          alignment: Alignment.center,
                          child: cards[currentCardIndex + 1],
                        ),
                    ],
                    onLeftSwipe: () => swipeLeft(),
                    onRightSwipe: () => swipeRight(),
                  )
                else
                  Expanded(
                    child: Center(
                      child: FlatButton(
                        child: Text("Reset deck"),
                        onPressed: () => setState(() => currentCardIndex = 0),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        mini: true,
                        onPressed: () {},
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                      ),
                      FloatingActionButton(
                        mini: true,
                        onPressed: () {},
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                      ),
                      FloatingActionButton(
                        mini: true,
                        onPressed: () {},
                      ),
                    ],
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

  void swipeLeft() {
    print("card swiped to the left");
    setState(() {
      currentCardIndex++;
    });
  }

  void swipeRight() {
    print("card swiped to the right");
    setState(() {
      currentCardIndex++;
    });
  }
}
