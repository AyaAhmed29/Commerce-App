import 'package:commerce_app/constant.dart';
import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:commerce_app/core/utlis/service/sharpref_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({
    super.key,
    required this.backgroundimage,
    required this.image,
    required this.widgetText,
    required this.descText,
    required this.isvisible,
  });
  final String backgroundimage;
  final String image;
  final Widget widgetText;
  final String descText;
  final bool isvisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SvgPicture.asset(
              backgroundimage,
              width: MediaQuery.of(context).size.width,
            ),
            SafeArea(
              child: Visibility(
                visible: isvisible,
                child: TextButton(
                    onPressed: () {
                      SharprefSingleton.setBool(konboardSeen, true);
                      GoRouter.of(context).go(AppRouter.signUp);
                    },
                    child: Text(
                      'تخطى',
                      style:
                          AppStyle.regular16.copyWith(color: Colors.blueGrey),
                    )),
              ),
            ),
            Positioned(
                bottom: 0, right: 0, left: 0, child: SvgPicture.asset(image)),
          ],
        ),
        widgetText,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            textAlign: TextAlign.center,
            descText,
            style: AppStyle.semiBold13,
          ),
        ),
      ],
    );
  }
}
