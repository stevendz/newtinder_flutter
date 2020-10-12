import 'package:flutter/material.dart';
import 'package:newtinder/screens/card/swipeable_widget.dart';
import 'package:newtinder/widgets/buttons/button_swipe_action.dart';

class SwipeActionsRow extends StatelessWidget {
  final SwipeableWidgetController cardController;
  const SwipeActionsRow({
    Key key,
    this.cardController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonSwipeAction(
          icon: 'undo',
          color: Colors.orange.shade400,
          big: false,
        ),
        ButtonSwipeAction(
          icon: 'cross',
          color: Colors.red.shade400,
          big: true,
          onPressed: () {
            cardController.triggerSwipeLeft();
          },
        ),
        ButtonSwipeAction(
          icon: 'thunder',
          color: Colors.purple.shade400,
          big: false,
        ),
        ButtonSwipeAction(
          icon: 'heart',
          color: Colors.tealAccent,
          big: true,
          onPressed: () {
            cardController.triggerSwipeRight();
          },
        ),
        ButtonSwipeAction(
          icon: 'star',
          color: Colors.lightBlue,
          big: false,
        ),
      ],
    );
  }
}
