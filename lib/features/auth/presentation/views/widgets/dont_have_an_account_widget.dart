import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/auth/presentation/views/sign_up_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
              text: "لا تمتلك حساب؟ ",
              style: TextStyles.semiBold16.copyWith(
                color: const Color(0xff949D9E),
              )),
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap=(){
                Navigator.pushNamed(context, SignUpView.routeName);
              },
              text: "قم بانشاء حساب",
              style: TextStyles.bold16.copyWith(
                color: AppColors.primaryColor,
              )),
        ],
      ),
    );
  }
}
