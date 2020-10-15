import 'package:flutter/material.dart';
import 'package:newtinder/screens/user/chats_screen.dart';
import 'package:newtinder/screens/user/matches_screen.dart';
import 'package:newtinder/screens/user/profile_screen.dart';
import 'package:newtinder/screens/user/swipe_screen.dart';
import 'package:newtinder/widgets/home/top_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  final index;

  const HomeScreen({Key key, this.index = 0}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Widget> screens = [
    SwipeScreen(),
    MatchesScreen(),
    ChatsScreen(),
    ProfileScreen(),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: screens.length, initialIndex: widget.index);
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
