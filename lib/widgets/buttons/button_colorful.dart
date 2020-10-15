import 'package:flutter/material.dart';
import 'package:newtinder/constants.dart';

class ButtonColorful extends StatelessWidget {
  final Function onPressed;
  final String title;
  final double elevation;
  final List<Color> colors;
  const ButtonColorful({
    Key key,
    @required this.onPressed,
    @required this.title,
    this.elevation = 0,
    this.colors = const [
      tinderRed,
      tinderOrange,
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          gradient: onPressed != null
              ? LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: colors,
                )
              : null,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              blurRadius: elevation,
              offset: Offset(0, elevation),
              color: Colors.blueGrey.withOpacity(0.5),
            ),
          ],
        ),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
