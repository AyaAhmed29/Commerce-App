import 'package:commerce_app/feature/Sign_up/presentation/view/sign_up.dart';
import 'package:commerce_app/feature/onboarding/presentation/view/on_boarding_view.dart';
import 'package:commerce_app/feature/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const onBoardingView = '/OnBoardingView';
  static const signUp = '/SignUp';
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
      path: signUp,
      builder: (context, state) => const SignUp(),
    ),
  ]);
}
