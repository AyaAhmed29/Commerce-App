import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({
    super.key,
    required this.backgroundimage,
    required this.image,
    required this.widgetText,
    required this.descText,
   
  });
  final String backgroundimage;
  final String image;
  final Widget widgetText;
  final String descText;
  

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
               
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'تخطى',
                    )),
              ),
            ),
            Positioned(
                bottom: 0, right: 0, left: 0, child: SvgPicture.asset(image)),
          ],
        ),
        widgetText,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(descText),
        ),
      ],
    );
  }
}
