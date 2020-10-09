import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/icons/logo.svg',
          height: 35,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Text(
          'tinder',
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.bold,
            letterSpacing: -2,
          ),
        ),
      ],
    );
  }
}
