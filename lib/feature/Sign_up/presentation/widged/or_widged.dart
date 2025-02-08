import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:flutter/material.dart';

class OrWidged extends StatelessWidget {
  const OrWidged({ super.key });

  @override
  Widget build(BuildContext context) {
    return           const Row(
            children: [
              Expanded(
                child: Divider(),
              ),
              SizedBox(width: 18),
              Text(
                'أو',
                style: AppStyle.regular16,
              ),
              SizedBox(width: 18),
              Expanded(
                child: Divider(),
              ),
            ],
          );
  }
}