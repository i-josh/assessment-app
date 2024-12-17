import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/colors.dart';

class StatWidget extends StatefulWidget {
  const StatWidget({
    required this.title,
    required this.count,
    required this.color,
    this.shape = BoxShape.rectangle,
    this.textColor = whiteColor,
    super.key,
  });

  final String title;
  final int count;
  final BoxShape shape;
  final Color color;
  final Color textColor;

  @override
  State<StatWidget> createState() => _StatWidgetState();
}

class _StatWidgetState extends State<StatWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _controller.addListener(() {
      if (_controller.isCompleted && mounted) {
        setState(() {
          _showContent = true;
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                double size = _animation.value * constraints.maxWidth;

                return Container(
                  padding: const EdgeInsets.all(20),
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                      color: widget.color,
                      shape: widget.shape,
                      borderRadius: widget.shape == BoxShape.circle
                          ? null
                          : BorderRadius.circular(20)),
                  child: _showContent
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(color: widget.textColor),
                            ),
                            Column(
                              children: [
                                TweenAnimationBuilder<int>(
                                    tween: IntTween(
                                        begin: (widget.count / 0.8).ceil(),
                                        end: widget.count),
                                    duration: const Duration(milliseconds: 800),
                                    builder: (context, value, child) {
                                      return Text(
                                        "$value",
                                        style: TextStyle(
                                            color: widget.textColor,
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.w700),
                                      );
                                    }),
                                Text(
                                  "offers",
                                  style: TextStyle(color: widget.textColor),
                                ),
                              ],
                            ),
                            const SizedBox()
                          ],
                        )
                      : const SizedBox.shrink(),
                );
              });
        },
      ),
    );
  }
}
