import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/features/on_boarding/widgets/page_view_item.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Expanded(child: OnBoardingPageView())],
    );
  }
}

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        PageViewItem(
          image: Assets.assetsImagesPageViewItem1Image,
          backgroundImage: Assets.assetsImagesPageViewItem1BackgroundImage,
          subTitle: "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          title: Row(
            children: [
              Text("مرحبًا بك في"),
              Text("Fruit"),
              Text(" HUB"),
            ],
          ),
        )
      ],
    );
  }
}
