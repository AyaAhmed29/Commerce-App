import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/assets.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:commerce_app/core/widget/custom_appbar.dart';
import 'package:commerce_app/core/widget/custom_button.dart';
import 'package:commerce_app/features/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:commerce_app/features/auth/presentation/widged/auth_navigation_text.dart';
import 'package:commerce_app/features/auth/presentation/widged/custom_textfield.dart';
import 'package:commerce_app/features/auth/presentation/widged/or_widged.dart';
import 'package:commerce_app/features/auth/presentation/widged/sign_with.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  String? email, pass;

  GlobalKey<FormState> formState = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تسجيل الدخول',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: Form(
        key: formState,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
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
              TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.forgotPasswordView);
                  },
                  child: Text(
                    'نسيت كلمة المرور؟',
                    style: AppStyle.semiBold13
                        .copyWith(color: AppColors.lightGreen),
                  )),
              CustomButton(
                  ontap: () {
                    if (formState.currentState!.validate()) {
                      formState.currentState!.save();
                      context
                          .read<SignInCubit>()
                          .signInWithEmailAndPassword(email!, pass!);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'تسجيل دخول'),
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
              SignWith(
                text: 'تسجيل بواسطه جوجل',
                imageIcon: Assets.imagesGoogleIcon,
                onTap: () {
                  context.read<SignInCubit>().signInWithGoogle();
                },
              ),
              const SignWith(
                text: 'تسجيل بواسطه أبل',
                imageIcon: Assets.imagesApplIcon,
              ),
              SignWith(
                text: 'تسجيل بواسطه فيسبوك',
                imageIcon: Assets.imagesFacebookIcon,
                onTap: () {
                  context.read<SignInCubit>().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
