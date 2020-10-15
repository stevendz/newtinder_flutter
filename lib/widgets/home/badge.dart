import 'package:flutter/material.dart';
import 'package:newtinder/constants.dart';

class Badge extends StatelessWidget {
  final int value;
  const Badge({
    Key key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: tinderGold,
      radius: 7,
      child: FittedBox(
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Text(
            value.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
