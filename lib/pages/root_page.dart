import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:banking_ui_flutter/pages/dashboard_page.dart';
import 'package:banking_ui_flutter/theme/color.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getTabs(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            pageIndex = 4;
          })
        },
        backgroundColor: primary,
        child: const Icon(
          Icons.credit_card,
          size: 25,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DashboardPage(),
        Container(
          child: Center(
            child: Text("Chat Page"),
          ),
        ),
        Container(
          child: Center(
            child: Text("Notification Page"),
          ),
        ),
        Container(
          child: Center(
            child: Text("Profile Page"),
          ),
        ),
      ],
    );
  }

  Widget getTabs() {
    List<IconData> iconsItems = [
      Icons.dashboard,
      Icons.comment,
      Icons.notifications,
      Icons.account_circle,
    ];
    return AnimatedBottomNavigationBar(
        icons: iconsItems,
        activeIndex: pageIndex,
        splashColor: secondary,
        activeColor: primary,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        inactiveColor: black.withOpacity(0.5),
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        });
  }
}
