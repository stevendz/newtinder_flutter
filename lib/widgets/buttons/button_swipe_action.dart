import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonSwipeAction extends StatelessWidget {
  final String icon;
  final Color color;
  final bool big;
  final Function onPressed;
  const ButtonSwipeAction({
    Key key,
    this.icon,
    this.color,
    this.big,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed != null ? 1 : 0,
      child: FloatingActionButton(
        mini: !big,
        backgroundColor: Colors.white,
        elevation: 2,
        child: SvgPicture.asset(
          'assets/icons/$icon.svg',
          height: big ? (icon == 'heart' ? 30 : 25) : 20,
          color: color,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
