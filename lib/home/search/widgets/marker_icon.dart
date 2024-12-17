import 'package:assessment/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkerIcon extends StatefulWidget {
  const MarkerIcon({super.key});

  @override
  State<MarkerIcon> createState() => _MarkerIconState();
}

class _MarkerIconState extends State<MarkerIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.w),
          topRight: Radius.circular(12.w),
          bottomRight: Radius.circular(12.w),
        ),
      ),
      child: const Center(
        child: Icon(
                Icons.apartment_sharp,
                color: whiteColor,
              ),
      ),
    );
  }
}
