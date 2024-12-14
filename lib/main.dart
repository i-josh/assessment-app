import 'package:assessment/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      builder: (context,child) {
        return MaterialApp(
          title: 'Assessment App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme().apply(
              bodyColor: blackColor,
            ),
          ),
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}
