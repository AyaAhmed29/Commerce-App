import 'package:commerce_app/constant.dart';
import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/assets.dart';
import 'package:commerce_app/core/utlis/service/sharpref_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (SharprefSingleton.getbool(konboardSeen)) {
        GoRouter.of(context).go(AppRouter.signInView);
      } else {
        GoRouter.of(context).go(AppRouter.onBoardingView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
            width: MediaQuery.of(context).size.width,
            Assets.imagesSplashBottom,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
