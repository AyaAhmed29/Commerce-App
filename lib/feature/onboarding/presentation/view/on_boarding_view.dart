import 'package:a/feature/onboarding/presentation/Widget/display_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatelessWidget {
  final controller = PageController();

  OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DisplayPage(),
          SmoothPageIndicator(
            count: 2,
            controller: controller,
            effect: const ExpandingDotsEffect(
                activeDotColor: Color(0xff1B5E37), dotColor: Color(0xffADDBAA)),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff1B5E37),
              ),
              onPressed: () {},
              child: const Text('ابدأ الان',
                  style: TextStyle(color: Colors.white)),
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
