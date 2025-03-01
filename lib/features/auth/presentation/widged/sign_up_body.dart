import 'package:commerce_app/constant.dart';
import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/service/show_snack_bar.dart';
import 'package:commerce_app/core/widget/custom_appbar.dart';
import 'package:commerce_app/core/widget/custom_button.dart';
import 'package:commerce_app/features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:commerce_app/features/auth/presentation/widged/custom_textfield.dart';
import 'package:commerce_app/features/auth/presentation/widged/auth_navigation_text.dart';
import 'package:commerce_app/features/auth/presentation/widged/password_text_field.dart';
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
                validator: (value) {
                  if (!emailRegex.hasMatch(value!)) {
                    return 'البريد الإلكتروني غير صالح، يرجى إدخال بريد صحيح';
                  }
                },
                text: ' البريد الالكترونى',
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value;
                },
              ),
              PasswordTextField(
                onSaved: (value) {
                  pass = value;
                },
              ),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const TermsConditionsText(),
                  activeColor: AppColors.darkGreen,
                  value: isChecked,
                  onChanged: (val) {
                    isChecked = val ?? false;
                    setState(() {});
                  }),
              CustomButton(
                  ontap: () {
                    if (formState.currentState!.validate() && isChecked) {
                      formState.currentState!.save(); 
                      context
                          .read<SignUpCubit>()
                          .createUserWithEmailAndPassword(
                              email!, pass!, userName!);
                    } else if (!isChecked) {
                      ShowSnackBar(
                          text: 'يجب الموافقة على الشروط والأحكام أولاً',
                          context: context);
                      return; // إيقاف التنفيذ إذا لم يكن `isChecked` مفعّلًا
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
