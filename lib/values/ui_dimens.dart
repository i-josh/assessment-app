import 'package:flutter/material.dart';


const double _tinySize = 5.0;
const double _smallSize = 10.0;
const double _mediumSize = 25.0;
const double _largeSize = 50.0;
const double _massiveSize = 120.0;

const tinyVerticalSpace = SizedBox(height: _tinySize);
const smallVerticalSpace = SizedBox(height: _smallSize);
const mediumVerticalSpace = SizedBox(height: _mediumSize);
const largeVerticalSpace = SizedBox(height: _largeSize);
const massiveVerticalSpace = SizedBox(height: _massiveSize);

const tinyHorizontalSpace = SizedBox(width: _tinySize);
const smallHorizontalSpace = SizedBox(width: _smallSize);
const mediumHorizontalSpace = SizedBox(width: _mediumSize);
const largeHorizontalSpace = SizedBox(width: _largeSize);
const massiveHorizontalSpace = SizedBox(width: _massiveSize);

screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
screenHeight(BuildContext context) => MediaQuery.of(context).size.height;