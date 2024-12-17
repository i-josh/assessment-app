import 'package:assessment/home/dashboard/widgets/picture_grid_widget.dart';
import 'package:assessment/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({
    super.key,
  });

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn, // Animation curve
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
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
          padding:
              EdgeInsets.only(left: 8.w, right: 8.w, top: 8.w, bottom: 80.w),
          decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(color: whiteColor),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.w),
            ),
          ),
          child: PictureGridWidget(
            items: [
              PictureItem(
                  image: "assets/images/img_1.jpg",
                  location: "Gladkova St., 25"),
              PictureItem(
                  image: "assets/images/img_2.jpg", location: "Gubina St., 11"),
              PictureItem(
                  image: "assets/images/img_3.jpg", location: "Sedova St.,22"),
            ],
          )),
    );
  }
}
