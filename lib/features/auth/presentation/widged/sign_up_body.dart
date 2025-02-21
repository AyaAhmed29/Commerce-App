import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/widget/custom_appbar.dart';
import 'package:commerce_app/core/widget/custom_button.dart';
import 'package:commerce_app/features/auth/presentation/cubit/sign_up_cubit/sign_in_cubit.dart';
import 'package:commerce_app/features/auth/presentation/widged/custom_textfield.dart';
import 'package:commerce_app/features/auth/presentation/widged/auth_navigation_text.dart';
import 'package:commerce_app/features/auth/presentation/widged/terms_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpBody> {
  bool isChecked = false;
  String? email, pass, userName;

  GlobalKey<FormState> formState = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'حساب جديد',
        onPressed: () {
          GoRouter.of(context).pop(AppRouter.signInView);
        },
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formState,
           autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextField(
                text: 'الاسم الكامل',
                textInputType: TextInputType.name,
                onSaved: (value) {
                  userName = value;
                },
              ),
              CustomTextField(
                text: ' البريد الالكترونى',
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value;
                },
              ),
              CustomTextField(
                text: ' كلمة المرور',
                icon: const Icon(Icons.visibility),
                textInputType: TextInputType.visiblePassword,
                onSaved: (value) {
                  pass = value;
                },
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: AppColors.darkGreen,
                      value: isChecked,
                      onChanged: (value) {
                        value = isChecked ;
                        setState(() {});
                      }),
                  const TermsConditionsText()
                ],
              ),
              CustomButton(
                  ontap: () {
                    if (formState.currentState!.validate()) {
                      formState.currentState!.save();
                      context
                          .read<SignUpCubit>()
                          .createUserWithEmailAndPassword(
                              email!, pass!, userName!);
                    }
                  },
                  text: 'إنشاء حساب جديد'),
              const SizedBox(height: 5),
              AuthNavigationText(
                text: 'تمتلك حساب بالفعل؟',
                textNav: 'تسجيل دخول',
                onPressed: () {
                  GoRouter.of(context).pop(AppRouter.signInView);
                },
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
