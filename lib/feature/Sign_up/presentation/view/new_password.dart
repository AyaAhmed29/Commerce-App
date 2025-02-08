import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:commerce_app/core/widget/custom_button.dart';
import 'package:commerce_app/feature/Sign_up/presentation/view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop(AppRouter.verifyCodeView);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text(
          'كلمة مرور جديدة',
          style: AppStyle.bold19,
        ),
      ),
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
            const CustomTextFilgd(
              text: ' ',
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
            const CustomTextFilgd(
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
