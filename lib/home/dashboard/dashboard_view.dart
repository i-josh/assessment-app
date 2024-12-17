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
  bool _showTitleBar = false;
  bool _showGreeting = false;
  bool _showMessage = false;
  bool _showStats = false;
  bool _showGrid = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await Future.delayed(const Duration(milliseconds: 500)).whenComplete(() {
      if (mounted) {
        setState(() {
          _showTitleBar = true;
        });
      }
    });
    await Future.delayed(const Duration(milliseconds: 500)).whenComplete(() {
      if (mounted) {
        setState(() {
          _showGreeting = true;
        });
      }
    });
    await Future.delayed(const Duration(milliseconds: 500)).whenComplete(() {
      if (mounted) {
        setState(() {
          _showMessage = true;
        });
      }
    });
    await Future.delayed(const Duration(milliseconds: 500)).whenComplete(() {
      if (mounted) {
        setState(() {
          _showStats = true;
        });
      }
    });
    await Future.delayed(const Duration(milliseconds: 500)).whenComplete(() {
      if (mounted) {
        setState(() {
          _showGrid = true;
        });
      }
    });
  }

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
                  AnimatedOpacity(
                    opacity: _showTitleBar ? 1 : 0,
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 500),
                    child: const TitleBarWidget(),
                  ),
                  mediumVerticalSpace,
                  AnimatedOpacity(
                    opacity: _showGreeting ? 1 : 0,
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "Hi, Marina",
                      style: TextStyle(
                        color: beigeColor,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _showMessage ? 1 : 0,
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "let's select your perfect place",
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                  mediumVerticalSpace,
                  _showStats
                      ? const Row(
                          children: [
                            StatWidget(
                              title: "BUY",
                              count: 1034,
                              shape: BoxShape.circle,
                              color: Colors.orangeAccent,
                            ),
                            smallHorizontalSpace,
                            StatWidget(
                              title: "RENT",
                              count: 2212,
                              color: whiteColor,
                              textColor: beigeColor,
                            )
                          ],
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            _showGrid ? const GridWidget() : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
