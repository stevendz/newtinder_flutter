import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newtinder/screens/user/chats_screen.dart';
import 'package:newtinder/screens/user/profile_screen.dart';
import 'package:newtinder/screens/user/swipe_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  CollectionReference userDb = FirebaseFirestore.instance.collection("users");
  User user = FirebaseAuth.instance.currentUser;
  TabController _tabController;
  List<Widget> screens = [
    SwipeScreen(),
    Center(child: Text('2')),
    ChatsScreen(),
    ProfileScreen(),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: screens.length);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: TopNavigationBar(
            tabController: _tabController,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: screens,
        ),
      ),
    );
  }
}

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
  int currentIndex = 0;

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
