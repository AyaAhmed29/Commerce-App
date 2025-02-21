
import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:flutter/material.dart';

class TermsConditionsText extends StatelessWidget {
  const TermsConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'من خلال إنشاء حساب, فإنك توافق على ',
              style: AppStyle.regular13.copyWith(color: AppColors.grey),
            ),
            TextSpan(
              text: 'الشروط و الأحكام الخاصة بنا',
              style: AppStyle.regular13.copyWith(color: AppColors.lightGreen),
            )
          ],
        ),
      ),
    );
  }
}
