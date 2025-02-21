import 'package:commerce_app/core/utlis/app_colors.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,  
      required this.text,
      this.icon,
      required this.textInputType,
     required this.onSaved});
  final String text;
  final Icon? icon;
  final Function(String?) onSaved;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },
          onSaved: onSaved,
          keyboardType: textInputType,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.grey.withOpacity(.1),
            suffixIcon: icon,
            suffixIconColor: AppColors.grey,
            hintText: text,
            hintStyle: AppStyle.bold16.copyWith(color: AppColors.grey),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey, width: .4),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey, width: .4),
            ),
          ),
        ));
  }
}
