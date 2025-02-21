import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:commerce_app/core/widget/custom_appbar.dart';
import 'package:commerce_app/core/widget/custom_button.dart';
import 'package:commerce_app/features/auth/presentation/widged/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'التحقق من الرمز',
        onPressed: () {
          GoRouter.of(context).pop(AppRouter.signInView);
        },
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
             CustomTextField(
              text: '',
              textInputType: TextInputType.phone,
               onSaved: (value) {},
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
