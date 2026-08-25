import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/domain/entities/response/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBrandItem extends StatelessWidget {
  Category item;
  CategoryBrandItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CachedNetworkImage(
            height: 10.h,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: item.image ?? '',
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(color: AppColors.primaryDark),
            ),
            imageBuilder: (context, imageProvider) =>
                CircleAvatar(backgroundImage: imageProvider, radius: 50.r),
            errorWidget: (context, url, error) =>
                Icon(Icons.error, color: Colors.red),
          ),
        ),
        SizedBox(height: 8.h,),
        Expanded(
        flex: 4,
            child:Text(item.name??'',
            textWidthBasis: TextWidthBasis.longestLine,
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primaryDark,fontWeight: FontWeight.normal,
                fontSize: 14.sp
              ),
            ) )
      ],
    );
  }
}
