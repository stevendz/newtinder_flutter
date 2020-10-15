import 'package:flutter/material.dart';
import 'package:newtinder/constants.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class ButtonColorfulBorder extends StatelessWidget {
  final Function onPressed;
  final String title;
  const ButtonColorfulBorder({
    Key key,
    @required this.onPressed,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineGradientButton(
      child: Center(
        child: Text(
          title.toUpperCase(),
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      onTap: onPressed,
      strokeWidth: 2,
      padding: EdgeInsets.all(10),
      radius: Radius.circular(50),
      gradient: LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          tinderOrange,
          tinderRed,
        ],
      ),
    );
  }
}
