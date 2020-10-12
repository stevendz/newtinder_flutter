import 'package:flutter/material.dart';

class GetTinderGoldPageIndicator extends StatelessWidget {
  const GetTinderGoldPageIndicator({
    Key key,
    @required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 3,
          backgroundColor:
              currentIndex == 0 ? Colors.amberAccent.shade400 : Colors.grey,
        ),
        SizedBox(width: 5),
        CircleAvatar(
          radius: 3,
          backgroundColor:
              currentIndex == 1 ? Colors.purple.shade400 : Colors.grey,
        ),
        SizedBox(width: 5),
        CircleAvatar(
          radius: 3,
          backgroundColor: currentIndex == 2 ? Colors.lightBlue : Colors.grey,
        ),
        SizedBox(width: 5),
        CircleAvatar(
          radius: 3,
          backgroundColor:
              currentIndex == 3 ? Colors.orange.shade400 : Colors.grey,
        ),
        SizedBox(width: 5),
        CircleAvatar(
          radius: 3,
          backgroundColor: currentIndex == 4 ? Colors.tealAccent : Colors.grey,
        ),
      ],
    );
  }
}
