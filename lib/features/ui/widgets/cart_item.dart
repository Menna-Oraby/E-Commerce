import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routs.dart';
import 'package:e_commerce/domain/entities/response/get_products.dart';
import 'package:e_commerce/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatefulWidget {
  GetProducts item;
  CartItem({super.key, required this.item});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouts.product);
      },
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Container(
          height: 142.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.primary30Opacity, width: 1),
          ),
          child: Row(
            children: [
              _buildImageContainer(
                imageCover: widget.item.product?.imageCover ?? '',
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 8.w,
                    vertical: 12.h,
                  ),
                  child: Column(
                    children: [
                      _buildItemHeader(
                        title: widget.item.product?.title ?? "",
                        productId: widget.item.product?.id ?? "",
                      ),
                      SizedBox(height: 5.h),
                      //_buildItemDetails(),
                      SizedBox(height: 5.h),
                      _buildItemPrice(
                        price: widget.item.price?.toDouble() ?? 0.0,
                        count: widget.item.count ?? 0,
                        onPressedDecrement: () {
                          int count = widget.item.count!;
                          if (count > 1) {
                            count--;
                            setState(() {});
                            CartViewModel.get(
                              context,
                            ).updateCart(widget.item.product?.id ?? '', count);
                          }
                        },
                        onPressedIncrement: () {
                          int count = widget.item.count ?? 0;
                          count++;
                          setState(() {});
                          CartViewModel.get(
                            context,
                          ).updateCart(widget.item.product?.id ?? '', count);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer({required String imageCover}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary30Opacity, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          width: 130.w,
          height: 145.h,
          fit: BoxFit.cover,
          imageUrl: imageCover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(color: AppColors.yellowColor),
          ),
          errorWidget: (context, url, error) =>
              const Icon(Icons.error, color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildItemHeader({required String title, required String productId}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AutoSizeText(
            title,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            CartViewModel.get(context).deleteCart(productId);
          },
          child: Icon(
            CupertinoIcons.delete,
            color: AppColors.primaryColor,
            size: 25.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildItemDetails() {
    return Container();
  }

  Widget _buildItemPrice({
    required double price,
    required int count,
    required VoidCallback onPressedDecrement,
    required VoidCallback onPressedIncrement,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          'EGP $price',
          maxLines: 1,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.primaryColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: onPressedDecrement,
                icon: Icon(
                  Icons.remove_circle_outline_rounded,
                  color: AppColors.whiteColor,
                  size: 25.sp,
                ),
              ),

              AutoSizeText(
                '$count',
                maxLines: 1,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              IconButton(
                onPressed: onPressedIncrement,
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  color: AppColors.whiteColor,
                  size: 25.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
