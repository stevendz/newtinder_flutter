import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newtinder/constants.dart';
import 'package:newtinder/widgets/home/badge.dart';

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
    return StreamBuilder<QuerySnapshot>(
      stream: usersDb.where('likes', arrayContains: user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot> users = snapshot.data.docs.toList();
          int likes = users.length;

          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 3,
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
              buildNavigationItem(
                icon: 'logo',
                color: tinderRed,
              ),
              buildNavigationItem(
                value: likes,
                icon: 'diamond',
                color: tinderGoldLight,
              ),
              buildNavigationItem(
                icon: 'chat',
                color: tinderRed,
              ),
              buildNavigationItem(
                icon: 'user',
                color: tinderRed,
              ),
            ],
          );
        }
        return Material(child: Center(child: CircularProgressIndicator()));
      },
    );
  }

  BottomNavigationBarItem buildNavigationItem(
      {int value = 0, String icon, Color color}) {
    return BottomNavigationBarItem(
        icon: Stack(
          alignment: Alignment.topRight,
          children: [
            SvgPicture.asset(
              'assets/icons/$icon.svg',
              color: Colors.blueGrey.shade200,
              height: 25,
            ),
            value != 0
                ? Badge(value: value)
                : Container(
                    width: 0,
                    height: 0,
                  ),
          ],
        ),
        activeIcon: Stack(
          alignment: Alignment.topRight,
          children: [
            SvgPicture.asset(
              'assets/icons/$icon.svg',
              color: color,
              height: 25,
            ),
            value != 0
                ? Badge(value: value)
                : Container(
                    width: 0,
                    height: 0,
                  ),
          ],
        ),
        label: '1');
  }
}
