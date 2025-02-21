import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:flutter/material.dart';

class AuthNavigationText extends StatelessWidget {
  const AuthNavigationText(
      {super.key, required this.text, required this.textNav, required this.onPressed});
  final String text;
  final String textNav;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppStyle.semiBold16.copyWith(color: AppColors.grey),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textNav,
            style: AppStyle.semiBold16.copyWith(color: AppColors.darkGreen),
          ),
        ),
      ],
    );
  }
}
