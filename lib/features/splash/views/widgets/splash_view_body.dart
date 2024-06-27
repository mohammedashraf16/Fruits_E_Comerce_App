import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/generated/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           SvgPicture.asset(Assets.imagesPlant),
         ],
       ),
       SvgPicture.asset(Assets.imagesLogo),
       SvgPicture.asset(Assets.imagesSplashBottom,fit: BoxFit.fill,),
      ],
    );
  }
}
