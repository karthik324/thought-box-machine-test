import 'package:flutter/material.dart';
import 'package:thought_box_machine_test/utils/app_colors.dart';
import 'package:thought_box_machine_test/utils/app_styles.dart';

class Helper {
  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static void showSnackbar(BuildContext context,
      {required String message, bool isError = false}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? AppColors.redColor : AppColors.greenColor,
        content: Text(
          message,
          style: AppStyles.normalText,
        ),
      ),
    );
  }
}
