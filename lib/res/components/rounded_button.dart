import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.callback,
    required this.title,
    this.height = 50,
    this.width = double.infinity,
    this.loading = false,
    this.textColor = AppColors.blackColor,
    this.containerBackgroundColor = AppColors.primaryColor,
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback callback;
  final Color textColor, containerBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: containerBackgroundColor, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
                ),
        ),
      ),
    );
  }
}
