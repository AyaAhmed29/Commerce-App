import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:commerce_app/core/widget/custom_button.dart';
import 'package:commerce_app/feature/Sign_up/presentation/view/sign_in_view.dart';
import 'package:commerce_app/feature/Sign_up/presentation/widged/terms_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop(AppRouter.signInView);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text(
          'حساب جديد',
          style: AppStyle.bold19,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomTextFilgd(
                text: 'الاسم الكامل', textInputType: TextInputType.name),
            const CustomTextFilgd(
                text: ' البريد الالكترونى',
                textInputType: TextInputType.emailAddress),
            const CustomTextFilgd(
                text: ' كلمة المرور',
                icon: Icon(Icons.visibility),
                textInputType: TextInputType.visiblePassword),
            Row(
              children: [
                Checkbox(
                    activeColor: AppColors.darkGreen,
                    value: false,
                    onChanged: (value) {
                      isChecked = true;
                      setState(() {});
                    }),
                const TermsConditionsText()
              ],
            ),
            CustomButton(ontap: () {}, text: 'إنشاء حساب جديد'),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تمتلك حساب بالفعل؟',
                  style: AppStyle.semiBold16.copyWith(color: AppColors.grey),
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).pop(AppRouter.signInView);
                  },
                  child: Text(
                    'تسجيل دخول',
                    style: AppStyle.semiBold16
                        .copyWith(color: AppColors.darkGreen),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
