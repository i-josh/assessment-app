import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

import '../widgets/app_widgets.dart';
import 'dashboard/dashboard_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;
  final _navBarItems = [
    BottomNavItem(
      icon: UIcons.solidRounded.search,
    ),
    BottomNavItem(
      icon: UIcons.solidRounded.comment_alt,
    ),
    BottomNavItem(
      icon: UIcons.solidRounded.home,
    ),
    BottomNavItem(
      icon: UIcons.solidRounded.heart,
    ),
    BottomNavItem(
      icon: UIcons.solidRounded.user,
    )
  ];

  final _pages = [
    Container(),
    Container(),
    const DashboardView(),
    Container(),
    Container(),
  ];

  void _onItemTapped(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomBottomNavBar(
        unselectedItemColor: const Color(0xFF141413),
        selectedIndex: _currentIndex,
        onItemTapped: _onItemTapped,
        items: _navBarItems,
      ),
      body: _pages[_currentIndex],
    );
  }
}
