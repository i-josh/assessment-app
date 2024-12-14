import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/colors.dart';
import '../../values/ui_dimens.dart';
import 'widgets/dashboard_widgets.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              secondaryColor,
              primaryColor,
            ],
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleBarWidget(),
                  mediumVerticalSpace,
                  Text(
                    "Hi, Marina",
                    style: TextStyle(
                      color: beigeColor,
                      fontSize: 25.sp,
                    ),
                  ),
                  Text(
                    "let's select your perfect place",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 32.sp,
                    ),
                  ),
                  mediumVerticalSpace,
                  const Row(
                    children: [
                      StatWidget(
                        title: "BUY",
                        count: "1 034",
                        shape: BoxShape.circle,
                        color: Colors.orangeAccent,
                      ),
                      smallHorizontalSpace,
                      StatWidget(
                        title: "RENT",
                        count: "2 212",
                        color: whiteColor,
                        textColor: beigeColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 8.w, right: 8.w, top: 8.w, bottom: 80.w),
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
                      image: "assets/images/img_2.jpg",
                      location: "Gubina St., 11"),
                  PictureItem(
                      image: "assets/images/img_3.jpg",
                      location: "Sedova St.,22"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
