import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopNavigationBar extends StatefulWidget {
  final TabController tabController;
  const TopNavigationBar({
    Key key,
    @required this.tabController,
  }) : super(key: key);

  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  int currentIndex;

  @override
  void initState() {
    currentIndex = widget.tabController.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
        widget.tabController.animateTo(value);
      },
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/logo.svg',
              color: Colors.blueGrey.shade200,
              height: 25,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/logo.svg',
              height: 25,
            ),
            label: '1'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/diamond.svg',
              color: Colors.blueGrey.shade200,
              height: 25,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/diamond.svg',
              height: 25,
              color: Colors.redAccent,
            ),
            label: '1'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/chat.svg',
              color: Colors.blueGrey.shade200,
              height: 25,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/chat.svg',
              height: 25,
              color: Colors.redAccent,
            ),
            label: '1'),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/user.svg',
            color: Colors.blueGrey.shade200,
            height: 25,
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/user.svg',
            height: 25,
            color: Colors.redAccent,
          ),
          label: '1',
        ),
      ],
    );
  }
}
