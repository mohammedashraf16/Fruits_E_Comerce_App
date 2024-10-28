import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          const CustomTextFormField(
              hintText: "الاسم بالكامل", textInputType: TextInputType.text),
          const SizedBox(height: 16),
          const CustomTextFormField(
              hintText: "البريد الالكتروني",
              textInputType: TextInputType.emailAddress),
          const SizedBox(height: 16),
          const CustomTextFormField(
            hintText: "كلمه المرور",
            textInputType: TextInputType.visiblePassword,
            suffixIcon: Icon(
              color: Color(0xffC9CECF),
              Icons.remove_red_eye,
            ),
          ),
          const SizedBox(height: 16),
          const TermsAndConditionWidget(),
          const SizedBox(height: 30),
          CustomButton(onPressed: () {}, text: "إنشاء حساب جديد"),
          const SizedBox(height: 26),
          const HaveAnAccountWidget(),
        ],
      ),
    );
  }
}


