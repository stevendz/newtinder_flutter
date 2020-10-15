import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newtinder/constants.dart';

class ButtonFloatingDescription extends StatelessWidget {
  final bool big;
  final String icon;
  final String title;
  final Function onPressed;
  const ButtonFloatingDescription({
    Key key,
    this.big = false,
    @required this.icon,
    @required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          mini: !big,
          backgroundColor: big ? tinderRed : Colors.white,
          elevation: 2,
          child: SvgPicture.asset(
            'assets/icons/$icon.svg',
            height: big ? 30 : 18,
            color: big ? Colors.white : Colors.blueGrey.shade200,
          ),
          onPressed: onPressed,
        ),
        SizedBox(height: 5),
        Text(
          title.toUpperCase(),
          style: TextStyle(color: Colors.blueGrey.shade300, fontSize: 13),
        ),
      ],
    );
  }
}
