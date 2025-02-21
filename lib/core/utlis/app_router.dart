import 'package:commerce_app/features/auth/presentation/view/forgot_password_view.dart';
import 'package:commerce_app/features/auth/presentation/view/sign_in_view.dart';
import 'package:commerce_app/features/auth/presentation/view/sign_up_view.dart';
import 'package:commerce_app/features/auth/presentation/view/verify_code_view.dart';
import 'package:commerce_app/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:commerce_app/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const onBoardingView = '/OnBoardingView';
  static const signInView = '/SignInView';
  static const signUpView = '/SignUpView';
  static const forgotPasswordView = '/ForgotPasswordView';
  static const verifyCodeView = '/VerifyCodeView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: onBoardingView,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: signInView,
      builder: (context, state) =>  const SignInView(),
    ),
    GoRoute(
      path: signUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: forgotPasswordView,
      builder: (context, state) => const ForgotPasswordView(),
    ),
    GoRoute(
      path: verifyCodeView,
      builder: (context, state) => const VerifyCodeView(),
    ),
  ]);
}
