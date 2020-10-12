import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({
    Key key,
    this.image,
    this.text,
  }) : super(key: key);
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 1.25,
      width: MediaQuery.of(context).size.width * 0.95,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 36.0,
          color: Colors.white,
          shadows: [Shadow(blurRadius: 10, color: Colors.blueGrey.shade800)],
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
