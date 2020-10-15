import 'dart:ui';

import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    Key key,
    @required this.match,
    @required this.isTinderGold,
  }) : super(key: key);

  final Map<String, dynamic> match;
  final bool isTinderGold;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                match['profilePic'],
              ),
              fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: isTinderGold ? 0 : 3,
            sigmaY: isTinderGold ? 0 : 3,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
