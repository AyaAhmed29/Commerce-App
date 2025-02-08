import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.ontap, required this.text});

  final void Function() ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width * 1,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            foregroundColor: Colors.white,
            backgroundColor: AppColors.darkGreen,
          ),
          onPressed: ontap,
          child: Text(text, style: AppStyle.bold16),
        ),
      ),
    );
  }
}
