import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/colors.dart';

class StatWidget extends StatelessWidget {
  const StatWidget({
    required this.title,
    required this.count,
    required this.color,
    this.shape = BoxShape.rectangle,
    this.textColor = whiteColor,
    super.key,
  });

  final String title;
  final String count;
  final BoxShape shape;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          padding: EdgeInsets.all(20.w),
          height: constraints.maxWidth,
          width: constraints.maxWidth,
          decoration: BoxDecoration(
              color: color,
              shape: shape,
              borderRadius: shape == BoxShape.circle
                  ? null
                  : BorderRadius.circular(20.w)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: textColor),
              ),
              Column(
                children: [
                  Text(
                    count,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "offers",
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
              const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}