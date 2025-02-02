import 'package:a/core/utlis/assets.dart';
import 'package:a/feature/onboarding/presentation/Widget/custom_page.dart';
import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  const DisplayPage({super.key, });
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
       
        children: [
          CustomPage(
            backgroundimage: Assets.imagesPageViewItem1BackgroundImage,
            image: Assets.imagesPageViewItem1Image,
            widgetText: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('مرحبا بكم فى '),
                Text('fruit '),
                Text(
                  'HUB ',
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
            descText:
                'اكتشف تجربة تسوق فريده معFruitHUB استكشف مجموعتنا الواسعة من الفواكه الطازجه الممتازه واحصل على افضل العروض والجوده العالية.',
           
          ),
          Column(
            children: [
              CustomPage(
               
                backgroundimage: Assets.imagesPageViewItem2BackgroundImage,
                image: Assets.imagesPageViewItem2Image,
                widgetText: const Text('ابحث و تسوق'),
                descText:
                    'نقدم لك افضل الفواكه المختارخ بعناية.اطلع على التفاصيل و الصور و التقيمات للتأكد من اختيار الفاكهة المثالية',
                
              ),
            ],
          )
        ],
      ),
    );
  }
}
