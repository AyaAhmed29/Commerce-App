import 'package:commerce_app/core/widget/custom_appbar.dart';
import 'package:commerce_app/features/auth/presentation/widged/custom_textfield.dart';
import 'package:commerce_app/features/auth/presentation/widged/auth_navigation_text.dart';
import 'package:commerce_app/features/auth/presentation/widged/or_widged.dart';
import 'package:commerce_app/features/auth/presentation/widged/sign_with.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/assets.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:commerce_app/core/widget/custom_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تسجيل الدخول',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTextField(
              text: ' البريد الالكترونى',
              textInputType: TextInputType.emailAddress,
              onSaved: (value) {},
            ),
            CustomTextField(
              text: ' كلمة المرور',
              icon: const Icon(Icons.visibility),
              textInputType: TextInputType.visiblePassword,
             onSaved: (value) {},
            ),
            TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.forgotPasswordView);
                },
                child: Text(
                  'نسيت كلمة المرور؟',
                  style:
                      AppStyle.semiBold13.copyWith(color: AppColors.lightGreen),
                )),
            CustomButton(ontap: () async {}, text: 'تسجيل دخول'),
            const SizedBox(height: 16),
            AuthNavigationText(
              text: 'لا تمتلك حساب؟',
              textNav: ' قم بإنشاء حساب',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.signUpView);
              },
            ),
            const SizedBox(height: 30),
            const OrWidged(),
            const SignWith(
              text: 'تسجيل بواسطه جوجل',
              imageIcon: Assets.imagesGoogleIcon,
            ),
            const SignWith(
              text: 'تسجيل بواسطه أبل',
              imageIcon: Assets.imagesApplIcon,
            ),
            const SignWith(
              text: 'تسجيل بواسطه فيسبوك',
              imageIcon: Assets.imagesFacebookIcon,
            ),
          ],
        ),
      ),
    );
  }
}
