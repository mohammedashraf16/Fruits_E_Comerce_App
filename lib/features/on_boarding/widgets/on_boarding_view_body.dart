import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/services/shared_preferences_singleton.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/values_manager.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/auth/presentation/views/login_view.dart';
import 'package:fruits_app/features/on_boarding/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: currentPage == 1
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(.5)),
        ),
        const SizedBox(height: 43),
        Visibility(
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          visible: currentPage == 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
            child: CustomButton(
                onPressed: () {
                  Prefs.setBoolean(kIsOnBoardingViewSeen,true);
                  Navigator.of(context)
                      .pushReplacementNamed(LoginView.routeName);
                },
                text: "ابدأ الان"),
          ),
        ),
        const SizedBox(
          height: 43,
        )
      ],
    );
  }
}
