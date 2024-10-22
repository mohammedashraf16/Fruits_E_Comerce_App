import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/on_boarding/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children:  [
        PageViewItem(
          isVisible: (pageController.hasClients?pageController.page!.round():0)==0,
          image: Assets.assetsImagesPageViewItem1Image,
          backgroundImage: Assets.assetsImagesPageViewItem1BackgroundImage,
          subTitle:
          "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("مرحبًا بك في",style: TextStyles.bold23,),
              Text(" HUB",style: TextStyles.bold23.copyWith(
                color: AppColors.secondaryColor,
              ),),
              Text("Fruit",style: TextStyles.bold23.copyWith(
                color: AppColors.primaryColor,
              ),),
            ],
          ),
        ),
        PageViewItem(
          isVisible: (pageController.hasClients?pageController.page!.round():0)!=0,
          image: Assets.assetsImagesPageViewItem2Image,
          backgroundImage: Assets.assetsImagesPageViewItem2BackgroundImage,
          subTitle:
          "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          title: const Text(
            "ابحث وتسوق",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff0C0D0D),
              fontSize: 30,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
