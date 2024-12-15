import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

import '../widgets/app_widgets.dart';
import 'dashboard/dashboard_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
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
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );

    // Create the slide animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SlideTransition(
        position: _slideAnimation,
        child: CustomBottomNavBar(
          unselectedItemColor: const Color(0xFF141413),
          selectedIndex: _currentIndex,
          onItemTapped: _onItemTapped,
          items: _navBarItems,
        ),
      ),
      body: _pages[_currentIndex],
    );
  }
}
