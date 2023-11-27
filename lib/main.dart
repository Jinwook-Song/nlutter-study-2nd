import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/twitter/twitter_home_screen.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';

void main() {
  runApp(const MyApp());
}

const primaryColor = Color(0xFF1DA1F2);
const grey300 = Color(0xFFE0E0E0);
const grey400 = Color(0xFFBDBDBD);
const grey500 = Color(0xFF9E9E9E);
const grey600 = Color(0xFF757575);
const grey700 = Color(0xFF616161);
const titleStyle = TextStyle(
  fontSize: Sizes.size24,
  fontWeight: FontWeight.w800,
);
const subTitleStyle = TextStyle(
  fontSize: Sizes.size20,
  fontWeight: FontWeight.w600,
);
const labelStyle = TextStyle(
  fontSize: Sizes.size16,
  fontWeight: FontWeight.w600,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        primaryColor: primaryColor,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
        ),
      ),
      home: const TwitterHomeScreen(),
    );
  }
}
