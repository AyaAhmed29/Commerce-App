import 'package:commerce_app/constant.dart';
import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/assets.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:commerce_app/core/utlis/service/sharpref_singleton.dart';
import 'package:commerce_app/features/onboarding/presentation/Widget/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: [
                CustomPage(
                  isvisible: true,
                  backgroundimage: Assets.imagesPageViewItem1BackgroundImage,
                  image: Assets.imagesPageViewItem1Image,
                  widgetText: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('مرحبا بك فى ', style: AppStyle.bold19),
                      Text(
                        'HUB ',
                        style:
                            AppStyle.bold19.copyWith(color: AppColors.orange),
                      ),
                      Text(
                        'fruit ',
                        style: AppStyle.bold19
                            .copyWith(color: AppColors.darkGreen),
                      ),
                    ],
                  ),
                  descText:
                      'اكتشف تجربة تسوق فريده معFruitHUB استكشف مجموعتنا الواسعة من الفواكه الطازجه الممتازه واحصل على افضل العروض والجوده العالية.',
                ),
                const Column(
                  children: [
                    CustomPage(
                      isvisible: false,
                      backgroundimage:
                          Assets.imagesPageViewItem2BackgroundImage,
                      image: Assets.imagesPageViewItem2Image,
                      widgetText: Text(
                        'ابحث و تسوق',
                        style: AppStyle.bold19,
                      ),
                      descText:
                          'نقدم لك افضل الفواكه المختارخ بعناية.اطلع على التفاصيل و الصور و التقيمات للتأكد من اختيار الفاكهة المثالية',
                    ),
                  ],
                )
              ],
            ),
          ),
          SmoothPageIndicator(
            count: 2,
            controller: controller,
            effect: const JumpingDotEffect(
                activeDotColor: AppColors.darkGreen,
                dotColor: AppColors.lightGreen),
          ),
          const SizedBox(height: 70),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * .8,
            child: Visibility(
              visible: currentPage == 1,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.darkGreen,
                ),
                onPressed: () {
                  SharprefSingleton.setBool(konboardSeen, true);
                  GoRouter.of(context).go(AppRouter.signInView);
                },
                child: const Text('ابدأ الان',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
