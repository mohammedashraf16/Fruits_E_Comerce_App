import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/services/shared_preferences_singleton.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/values_manager.dart';
import 'package:fruits_app/features/auth/presentation/views/login_view.dart';
import 'package:fruits_app/features/on_boarding/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.assetsImagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo),
        SvgPicture.asset(
          Assets.assetsImagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void excuteNavigation() {
    bool? isOnBoardingViewSeen = Prefs.getBoolean(kIsOnBoardingViewSeen);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if(isOnBoardingViewSeen==false) {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }else{
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      },
    );
  }
}
