import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:commerce_app/core/widget/custom_appbar.dart';
import 'package:commerce_app/core/widget/custom_button.dart';
import 'package:commerce_app/features/auth/presentation/widged/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'نسيان كلمة المرور',
          onPressed: () {
            GoRouter.of(context).pop(AppRouter.signInView);
          }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'لا تقلق ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق',
                style: AppStyle.regular16,
              ),
            ),
            CustomTextField(
              onSaved: (value) {},
              text: 'ادخل رقم الهاتف',
              textInputType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            CustomButton(ontap: () {}, text: 'نسيت كلمة المرور'),
          ],
        ),
      ),
    );
  }
}
