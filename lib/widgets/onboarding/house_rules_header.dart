import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HouseRulesHeader extends StatelessWidget {
  const HouseRulesHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset('assets/icons/logo.svg'),
        SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Welcome to Tinder.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blueGrey.shade800,
            ),
            children: [
              WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Please follow these House Rules',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
