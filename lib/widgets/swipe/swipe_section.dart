import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newtinder/card/swipeable_card.dart';
import 'package:newtinder/card/swipeable_widget.dart';
import 'package:newtinder/constants.dart';

class SwipeSection extends StatefulWidget {
  final List<QueryDocumentSnapshot> userData;
  final SwipeableWidgetController cardController;
  final int currentCardIndex;
  final Function swipeLeft;
  final Function swipeRight;

  const SwipeSection(
      {Key key,
      this.userData,
      this.cardController,
      this.currentCardIndex,
      this.swipeLeft,
      this.swipeRight})
      : super(key: key);

  @override
  _SwipeSectionState createState() => _SwipeSectionState();
}

class _SwipeSectionState extends State<SwipeSection> {
  List<SwipeableCard> cards = [];
  @override
  Widget build(BuildContext context) {
    if (cards.isEmpty)
      widget.userData.forEach(
        (element) {
          if (element.id != user.uid) {
            cards.add(
              SwipeableCard(
                image: element.data()['profilePic'],
                text: element.data()['username'],
              ),
            );
          }
        },
      );
    if (widget.currentCardIndex < cards.length) {
      return SwipeableWidget(
        cardController: widget.cardController,
        animationDuration: 500,
        horizontalThreshold: 0.85,
        child: cards[widget.currentCardIndex],
        nextCards: <Widget>[
          if (!(widget.currentCardIndex + 1 >= cards.length))
            Align(
              alignment: Alignment.center,
              child: cards[widget.currentCardIndex + 1],
            ),
        ],
        onLeftSwipe: () {
          widget.swipeLeft(widget.userData[widget.currentCardIndex + 1].id);
        },
        onRightSwipe: () {
          widget.swipeRight(
              uid: widget.userData[widget.currentCardIndex + 1].id);
        },
      );
    } else {
      return Expanded(
        child: Center(
          child: FlatButton(
            child: Text("Reset deck"),
            onPressed: () {},
          ),
        ),
      );
    }
  }
}
