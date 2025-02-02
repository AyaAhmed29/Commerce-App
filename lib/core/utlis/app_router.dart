import 'package:a/feature/onboarding/presentation/view/on_boarding_view.dart';
import 'package:a/feature/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const onBoardingView = '/OnBoardingView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: onBoardingView,
      builder: (context, state) => OnBoardingView(),
    ),
  ]);
}
