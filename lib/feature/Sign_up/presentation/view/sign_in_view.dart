import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/assets.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:commerce_app/core/widget/custom_button.dart';
import 'package:commerce_app/feature/Sign_up/presentation/widged/or_widged.dart';
import 'package:commerce_app/feature/Sign_up/presentation/widged/sign_with.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop(AppRouter.router);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text('تسجيل الدخول', style: AppStyle.bold19,),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomTextFilgd(
              text: ' البريد الالكترونى',
              textInputType: TextInputType.emailAddress,
            ),
            const CustomTextFilgd(
              text: ' كلمة المرور',
              icon: Icon(Icons.visibility),
              textInputType: TextInputType.visiblePassword,
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
            CustomButton(ontap: () {}, text: 'تسجيل دخول'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لا تمتلك حساب؟',
                  style: AppStyle.semiBold16.copyWith(color: AppColors.grey),
                ),
                
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.signUpView);
                    },
                    child: Text(
                      ' قم بإنشاء حساب',
                      style: AppStyle.semiBold16
                          .copyWith(color: AppColors.darkGreen),
                    )),
              ],
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

class CustomTextFilgd extends StatelessWidget {
  const CustomTextFilgd({
    super.key,
    required this.text,
    this.icon,
    required this.textInputType,
  });
  final String text;
  final Icon? icon;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: TextFormField(
          keyboardType: textInputType,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.grey.withOpacity(.1),
            suffixIcon: icon,
            suffixIconColor: AppColors.grey,
            hintText: text,
            hintStyle: AppStyle.bold16.copyWith(color: AppColors.grey),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey, width: .4),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey, width: .4),
            ),
          ),
        ));
  }
}
