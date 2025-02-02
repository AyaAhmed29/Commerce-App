import 'package:a/core/utlis/app_router.dart';
import 'package:a/core/utlis/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Future.delayed(const Duration(seconds: 3), () {
        context.go(AppRouter.onBoardingView);
      });
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(Assets.imagesPlant),
            ],
          ),
          SvgPicture.asset(Assets.imagesLogo),
          SvgPicture.asset(
            Assets.imagesSplashBottom,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
