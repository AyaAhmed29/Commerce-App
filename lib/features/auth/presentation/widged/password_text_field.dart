
import 'package:commerce_app/features/auth/presentation/widged/custom_textfield.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
 

  const PasswordTextField({super.key, required this.onSaved});
   final  Function(String?)  onSaved;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      text: ' كلمة المرور',
      obscureText: obscureText,
      icon: obscureText
          ? IconButton(
              onPressed: () {
                obscureText = false;
                setState(() {});
              },
              icon: const Icon(
                Icons.visibility_off,
              ),
            )
          : IconButton(
              onPressed: () {
                obscureText = true;
                setState(() {});
              },
              icon: const Icon(
                Icons.visibility,
              ),
            ),
      textInputType: TextInputType.visiblePassword,
      onSaved: widget.onSaved,
    );
  }
}
