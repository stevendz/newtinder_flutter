import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newtinder/widgets/profile/tinder_gold/get_tinder_gold_slide.dart';

class GetTinderGoldSlider extends StatelessWidget {
  final Function getCurrentIndex;
  const GetTinderGoldSlider({
    Key key,
    this.getCurrentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          height: double.infinity,
          onPageChanged: (index, reason) {
            getCurrentIndex(index);
          },
          autoPlay: true,
        ),
        items: [
          GetTinderGoldSlide(
            icon: 'logo',
            title: 'Get Tinder Gold™',
            description: 'See who likes you & more!',
            color: Colors.amberAccent.shade400,
          ),
          GetTinderGoldSlide(
            icon: 'thunder',
            title: 'Get matches faster',
            description: 'Boost your influence once a month!',
            color: Colors.purple.shade400,
          ),
          GetTinderGoldSlide(
            icon: 'star',
            title: 'Shine with super likes',
            description: 'You\'re 3x more likely to get a match!',
            color: Colors.lightBlue,
          ),
          GetTinderGoldSlide(
            icon: 'undo',
            title: 'I meant to swipe right',
            description: 'Get unlimeted rewinds with Tinder Plus®!',
            color: Colors.orange.shade400,
          ),
          GetTinderGoldSlide(
            icon: 'heart',
            title: 'Increase your chances',
            description: 'Get unlimeted likes with Tinder Plus®',
            color: Colors.tealAccent,
          ),
        ],
      ),
    );
  }
}
