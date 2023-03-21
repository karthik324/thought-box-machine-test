import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thought_box_machine_test/utils/app_colors.dart';
import 'package:thought_box_machine_test/utils/app_images.dart';
import 'package:thought_box_machine_test/views/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const HomeScreen(
            title: 'Thought Box',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            AppImages.thoughtBoxLogo,
          ),
        ),
      ),
      child: const Scaffold(
        backgroundColor: AppColors.transparent,
      ),
    );
  }
}
