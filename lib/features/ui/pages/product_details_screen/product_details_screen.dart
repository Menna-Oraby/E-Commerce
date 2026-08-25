import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/response/product.dart';
import 'package:e_commerce/features/ui/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details', style: AppStyles.semi20Primary),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.primaryColor, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductSlider(initialIndex: 0, items: product.images!),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.title ?? '',
                      style: AppStyles.medium18Header,
                    ),
                  ),
                  Text('EGP${product.price}', style: AppStyles.medium18Header),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    child: Text(
                      '${product.sold} Sold',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.medium14tPrimaryDark,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Image.asset(AppAssets.starIcon, width: 20.w),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      '${product.ratingsAverage} (${product.ratingsQuantity})',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.regular14Text,
                    ),
                  ),
                  //container +,-
                ],
              ),
              SizedBox(height: 8.h),
              Text('Description', style: AppStyles.medium18Header),
              SizedBox(height: 8.h),
              ReadMoreText(
                product.description ?? '',
                style: AppStyles.medium14LightPrimary,
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimExpandedText: 'Read Less',
                trimCollapsedText: 'Read More',
                colorClickableText: AppColors.primaryColor,
              ),
              SizedBox(height: 16.h),
              Text('Size', style:AppStyles.medium18Header
                // TextStyle(fontSize: 30,color: Colors.white)
                ),
            ],
          ),
        ),
      ),

    );
  }
}
