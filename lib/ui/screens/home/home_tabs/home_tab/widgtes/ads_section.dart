import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdsSection extends StatelessWidget {
  List<String> sliderImages = [
    'assets/images/ads_image1.png',
    'assets/images/ads_image2.png',
    'assets/images/ads_image3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: MyColors.blueColor,
      indicatorBackgroundColor: MyColors.whiteColor,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: sliderImages
          .map((url) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  url,
                  fit: BoxFit.fill,
                  width: 398.w,
                  height: 200.h,
                ),
              ))
          .toList(),
    );
  }
}
