import 'package:assessment/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final List<BottomNavItem> items;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final double borderRadius;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.items,
    this.selectedItemColor = Colors.orangeAccent,
    this.unselectedItemColor = Colors.black,
    this.borderRadius = 40, // Default border radius
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: blackColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: items.map((item) {
            int index = items.indexOf(item);
            return _buildNavItem(item.icon, index);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        height: 50.w,
        width: 50.w,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color:
              selectedIndex == index ? selectedItemColor : unselectedItemColor,
          shape: BoxShape.circle,
        ),
        child: Center(
            child: Icon(
          icon,
          color: whiteColor,
          size: 20.w,
        )),
      ),
    );
  }
}

class BottomNavItem {
  final IconData icon;

  BottomNavItem({required this.icon});
}
