import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetTinderGoldSlide extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final Color color;
  const GetTinderGoldSlide({
    Key key,
    @required this.title,
    @required this.description,
    @required this.icon,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/$icon.svg',
                height: 25,
                color: color,
              ),
            ),
            Text(
              title.toUpperCase(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(description),
      ],
    );
  }
}
