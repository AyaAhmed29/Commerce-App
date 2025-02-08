import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignWith extends StatelessWidget {
  const SignWith({super.key, required this.text, required this.imageIcon});
  final String text;
  final String imageIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: .4),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          SvgPicture.asset(
            imageIcon,
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 50),
          Text(
            text,
            style: AppStyle.semiBold16,
          ),
        ],
      ),
    );
  }
}
