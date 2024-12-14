import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/colors.dart';

class PictureGridWidget extends StatelessWidget {
  final List<PictureItem> items;

  const PictureGridWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double gridSpacing = 8.0.w;
        final double gridWidth = constraints.maxWidth;
        final double smallItemWidth = (gridWidth - gridSpacing) / 2;
        final double largeItemWidth = gridWidth;

        return Wrap(
          spacing: gridSpacing,
          runSpacing: gridSpacing,
          children: List.generate(items.length, (index) {
            final bool isFirst = index == 0;
            return Container(
              width: isFirst ? largeItemWidth : smallItemWidth,
              height: 200.h,
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: blackColor,
                image: DecorationImage(
                  image: AssetImage(items[index].image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30.w),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Slider(
                  location: items[index].location,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class PictureItem {
  PictureItem({
    required this.image,
    required this.location,
  });

  final String image;
  final String location;
}

class Slider extends StatefulWidget {
  const Slider({required this.location, super.key});

  final String location;

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  final double _sliderPosition = 1.0;
  final double _handleRadius = 28.0.w;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              height: _handleRadius * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey.shade100.withOpacity(0.5),
              ),
              alignment: Alignment.center,
              child: Text(
                widget.location,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ),
        // Slider handle
        Positioned(
          right: _sliderPosition,
          child: CircleAvatar(
            radius: _handleRadius,
            backgroundColor: whiteColor,
            child: Icon(
              Icons.arrow_forward_ios,
              color: beigeColor,
              size: 16.w,
            ),
          ),
        ),
      ],
    );
  }
}