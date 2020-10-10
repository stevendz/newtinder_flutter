import 'package:flutter/material.dart';
import 'package:newtinder/widgets/profile/tinder_gold/get_tinder_gold_slider.dart';

class GetTinderGold extends StatelessWidget {
  const GetTinderGold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GetTinderGoldSlider(),
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
                'Get tinder gold™'.toUpperCase(),
                style: TextStyle(color: Colors.amberAccent.shade400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
