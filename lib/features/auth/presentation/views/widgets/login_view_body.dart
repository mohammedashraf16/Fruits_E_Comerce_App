import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/utils/values_manager.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/or_divider_widget.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const CustomTextFormField(
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const CustomTextFormField(
                hintText: 'كلمه المرور',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xFFC9CECF),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                textAlign: TextAlign.end,
                "نسيت كمله المرور ؟",
                style: TextStyles.bold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
              const SizedBox(height: 33),
              CustomButton(
                onPressed: () {},
                text: "تسجيل الدخول",
              ),
              const SizedBox(height: 33),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 49),
              const OrDividerWidget(),
              const SizedBox(height: 16),
              SocialLoginButton(title: "تسجيل بواسطة جوجل", image: Assets.imagesGoogleIcon, onPressed: (){}),
              const SizedBox(height: 16),
              SocialLoginButton(title: "تسجيل بواسطة أبل", image: Assets.imagesAppleIcon, onPressed: (){}),
              const SizedBox(height: 16),
              SocialLoginButton(title: "تسجيل بواسطة فيسبوك", image: Assets.imagesFacebookIcon, onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
