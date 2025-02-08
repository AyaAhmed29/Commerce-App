import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:commerce_app/core/widget/custom_button.dart';
import 'package:commerce_app/feature/Sign_up/presentation/view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop(AppRouter.forgotPasswordView);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text(
          'التحقق من الرمز',
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
                'أدخل الرمز الذى أرسلناه ألى عنوان بريد التالى Maxxx@email.com',
                style: AppStyle.regular16,
              ),
            ),
            const CustomTextFilgd(
              text: '',
              textInputType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            CustomButton(ontap: () {}, text: 'تحقق من الرمز'),
            TextButton(
                onPressed: () {},
                child: Text(
                  'إعادة إرسال الرمز',
                  style:
                      AppStyle.semiBold16.copyWith(color: AppColors.darkGreen),
                )),
          ],
        ),
      ),
    );
  }
}
