import 'package:commerce_app/core/utlis/app_router.dart';
import 'package:commerce_app/core/utlis/fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onPressed;
  const CustomAppBar({super.key, required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          GoRouter.of(context).pop(AppRouter.signInView);
        },
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: AppStyle.bold19,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
