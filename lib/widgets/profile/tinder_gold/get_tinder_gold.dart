import 'package:flutter/material.dart';
import 'package:newtinder/constants.dart';
import 'package:newtinder/widgets/profile/tinder_gold/get_tinder_gold_page_indicator.dart';
import 'package:newtinder/widgets/profile/tinder_gold/get_tinder_gold_slider.dart';

class GetTinderGold extends StatefulWidget {
  const GetTinderGold({
    Key key,
  }) : super(key: key);

  @override
  _GetTinderGoldState createState() => _GetTinderGoldState();
}

class _GetTinderGoldState extends State<GetTinderGold> {
  bool getTinderGold = true;
  int currentIndex = 0;

  void getCurrentIndex(newIndex) {
    if (newIndex == 1 || newIndex == 4) getTinderGold = false;
    if (newIndex == 0) getTinderGold = true;
    currentIndex = newIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GetTinderGoldSlider(getCurrentIndex: getCurrentIndex),
          GetTinderGoldPageIndicator(currentIndex: currentIndex),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RawMaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              fillColor: Colors.white,
              onPressed: () {},
              child: Text(
                getTinderGold
                    ? 'Get tinder gold™'.toUpperCase()
                    : 'My tinder plus®'.toUpperCase(),
                style: TextStyle(
                  color: getTinderGold ? tinderGold : tinderRed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
