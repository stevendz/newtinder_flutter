import 'package:flutter/material.dart';
import 'package:newtinder/screens/card/swipeable_card.dart';
import 'package:newtinder/screens/card/swipeable_widget.dart';

class SwipeSection extends StatelessWidget {
  final List<SwipeableCard> cards;
  final SwipeableWidgetController cardController;
  final int currentCardIndex;
  final Function swipeLeft;
  final Function swipeRight;

  const SwipeSection(
      {Key key,
      this.cards,
      this.cardController,
      this.currentCardIndex,
      this.swipeLeft,
      this.swipeRight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (currentCardIndex < cards.length) {
      return SwipeableWidget(
        cardController: cardController,
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
        onLeftSwipe: swipeLeft,
        onRightSwipe: swipeRight,
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
