import 'package:flutter/material.dart';
import 'package:flutter_mmv_with_getx/res/colors/app_colors.dart';
import 'package:get/get.dart';

class GeneralExceptionWidget extends StatefulWidget {

  final VoidCallback onPressed;
  const GeneralExceptionWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.cloud_off, color: AppColors.redColor, size: 60),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("general_exception".tr, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
                ),
                SizedBox(height: Get.height * 0.14),
                GestureDetector(
                  onTap: widget.onPressed,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "retry_button".tr,
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.blackColor),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
