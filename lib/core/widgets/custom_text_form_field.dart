import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hintText, required this.textInputType, this.suffixIcon, this.onSaved, this.obscureText = false,});

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xff949D9E),

        ),
        filled: true,
        fillColor: const Color(0xfff9fafa),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          width: 1,
          color: Color(0xffE6E9E9),
        )
    );
  }
}
