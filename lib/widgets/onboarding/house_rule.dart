import 'package:flutter/material.dart';

class HouseRule extends StatelessWidget {
  final String rule;
  const HouseRule({
    Key key,
    @required this.rule,
  }) : super(key: key);

  static const Map<String, String> rules = {
    'Be yourself.':
        'Make sure your photos, age, and bio are true to who you are.',
    'Stay safe.': 'Don\'t be too quick to give out personal information.',
    'Play it cool.':
        'Respect others and treat them as you would like to be treated.',
    'Be proactive.': 'Always report bad behavior.',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.check,
              color: Color(0xffFE446D),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                rule,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blueGrey.shade800),
              ),
            ),
          ],
        ),
        Text(rules[rule], style: TextStyle(color: Colors.blueGrey)),
      ],
    );
  }
}
