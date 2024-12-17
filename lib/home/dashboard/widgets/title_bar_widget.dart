import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/colors.dart';

class TitleBarWidget extends StatefulWidget {
  const TitleBarWidget({
    super.key,
  });

  @override
  State<TitleBarWidget> createState() => _TitleBarWidgetState();
}

class _TitleBarWidgetState extends State<TitleBarWidget> {
  bool _showContent = false;
  double _pictureSize = 0;
  final int _animationDuration = 800;

  @override
  void initState() {
    _animateBox();
    super.initState();
  }

  void _animateBox() async {
    await Future.delayed(const Duration(milliseconds: 800));
    if(mounted) {
      setState(() {
      _showContent = true;
      _pictureSize = 50;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          constraints: const BoxConstraints(
            minWidth: 30,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(12)),
          child: AnimatedSize(
            duration: Duration(milliseconds: _animationDuration),
            curve: Curves.easeInOut,
            child: Visibility(
              visible: _showContent,
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
          ),
        ),
        AnimatedContainer(
          height: _pictureSize,
          width: _pictureSize,
          duration: Duration(milliseconds: _animationDuration),
          curve: Curves.easeIn,
          decoration: const BoxDecoration(
              color: Colors.orange,
              image: DecorationImage(
                  image: AssetImage('assets/images/user.jpeg'),
                  fit: BoxFit.cover),
              shape: BoxShape.circle),
        )
      ],
    );
  }
}
