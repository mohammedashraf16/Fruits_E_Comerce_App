import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });

  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: (value) {},
      hintText: "كلمه المرور",
      textInputType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: Icon(
          color: const Color(0xffC9CECF),
          obscureText ? Icons.remove_red_eye : Icons.visibility_off,
        ),
      ),
    );
  }
}
