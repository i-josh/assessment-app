import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/colors.dart';

class TitleBarWidget extends StatelessWidget {
  const TitleBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(12.w)),
          child: const Row(
            children: [
              Icon(
                Icons.location_on,
                color: beigeColor,
              ),
              Text(
                "Saint Petersburg",
                style: TextStyle(color: beigeColor),
              )
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.orange,
          radius: 25.w,
          backgroundImage: const AssetImage('assets/images/user.jpeg'),
        )
      ],
    );
  }
}