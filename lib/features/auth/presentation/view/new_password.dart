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
      appBar:
      CustomAppBar(title:  'كلمة مرور جديدة', onPressed:   () {
            GoRouter.of(context).pop(AppRouter.verifyCodeView);
          })
      ,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'قم بإنشاء كلمة مرور جديدة لتسجيل الدخول',
                style: AppStyle.regular16,
              ),
            ),
             CustomTextField(
               onSaved: (value) {},
              text: ' ',
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
             CustomTextField(
               onSaved: (value) {},
              text: ' ',
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
            CustomButton(ontap: () {}, text: ' إنشاء كلمة مرور جديدة'),
          ],
        ),
      ),
    );
  }
}
