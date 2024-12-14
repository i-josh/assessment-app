import 'package:assessment/values/colors.dart';
import 'package:flutter/material.dart';

// Custom Bottom Navigation Bar widget
class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex; // Current selected index
  final Function(int) onItemTapped; // Callback when an item is tapped
  final List<BottomNavItem> items; // List of bottom nav items
  final Color selectedItemColor; // Color for the selected item
  final Color unselectedItemColor; // Color for the unselected items
  final double borderRadius; // Border radius for rounded corners

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.items,
    this.selectedItemColor = Colors.orangeAccent,
    this.unselectedItemColor = Colors.black,
    this.borderRadius = 40.0, // Default border radius
  });

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height * 0.08; // Responsive height

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(20),
        height: height,
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
        height: 50,
        width: 50,
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
          size: 20,
        )),
      ),
    );
  }
}

class BottomNavItem {
  final IconData icon;

  BottomNavItem({required this.icon});
}
