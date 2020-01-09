import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/auth_services.dart';
import '../screens/home-screen-pages/activity.dart';
import '../screens/home-screen-pages/camera.dart';
import '../screens/home-screen-pages/notification.dart';
import 'home-screen-pages/profile/profile.dart';
import '../screens/home-screen-pages/search.dart';

class HomeScreen extends StatefulWidget {
  static final id = 'home_screen';
   final String userId;
  HomeScreen({this.userId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected = 0;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Center(
            child: Text(
              "Instagram",
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Billabong', color: Colors.black),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          currentIndex: _selected,
          onTap: (int index) {
            setState(() {
              _selected = index;
            });
            _pageController.animateToPage(_selected,
                duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          },
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 32.8,
                ),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 32.8,
                ),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.photo_camera,
                  size: 32.8,
                ),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  size: 32.8,
                ),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 32.8,
                ),
                title: SizedBox.shrink())
          ],
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            Activity(),
            Search(),
            Camera(),
            NotificationPage(),
            Profile(userId: widget.userId,),
          ],
          onPageChanged: (int index) {
            setState(() {
              _selected = index;
            });
          },
        ),
      ),
    );
  }
}
