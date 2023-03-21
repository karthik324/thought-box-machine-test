import 'package:flutter/material.dart';
import 'package:thought_box_machine_test/utils/app_colors.dart';
import 'package:thought_box_machine_test/views/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thought Box',
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}
