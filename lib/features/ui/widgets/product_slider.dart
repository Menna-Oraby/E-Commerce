import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductSlider extends StatelessWidget {
  final int initialIndex;
  final List<String> items;

  const ProductSlider({
    super.key,
    required this.initialIndex,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(
      initialPage: initialIndex,
    );

    return Container(
      height: 300.h,//less
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.blueGrey.shade200,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          /// Images
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: PageView.builder(
              controller: pageController,
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Image.network(
                  items[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
            ),
          ),

          /// Favorite Button
          Positioned(
            top: 12.h,
            right: 12.w,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  // TODO: favorite logic
                },
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.blue.shade800,
                  size: 24.sp,
                ),
              ),
            ),
          ),

          /// Page Indicator
          Positioned(
            bottom: 8.h,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: items.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.blue.shade800,
                  dotColor: Colors.blue.shade800,
                  dotHeight: 7.h,
                  dotWidth: 7.w,
                  spacing: 8.w,
                  expansionFactor: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}