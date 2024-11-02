import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.title,
      required this.image,
      required this.onPressed});

  final String title;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: const BorderSide(
              color: Color(0xffDCDEDE),
              width: 1,
            )),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity
          ),
          leading: SvgPicture.asset(image),
          title: Text(
            title,
            style: TextStyles.semiBold16,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
