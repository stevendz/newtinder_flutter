import 'package:flutter/material.dart';
import 'package:newtinder/constants.dart';
import 'package:newtinder/widgets/buttons/button_colorful.dart';

class GetTinderGoldButton extends StatelessWidget {
  final Function toggleTinderGold;
  const GetTinderGoldButton({
    Key key,
    @required this.toggleTinderGold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2,
            vertical: 20,
          ),
          child: ButtonColorful(
            onPressed: toggleTinderGold,
            title: 'See who likes you',
            elevation: 2,
            colors: [
              tinderGold,
              tinderGoldLight,
            ],
          ),
        ),
      ],
    );
  }
}
