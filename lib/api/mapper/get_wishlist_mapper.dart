import 'package:e_commerce/api/mapper/category_mapper.dart';
import 'package:e_commerce/api/mapper/subcategory_mapper.dart';
import 'package:e_commerce/api/model/response/wishlist/get_wishlist/get_wishlist_dto.dart';
import 'package:e_commerce/domain/entities/response/get_wishlist.dart';

extension GetWishlistMapper on GetWishlistDto {
  GetWishlist toGetWishlist() {
    return GetWishlist(
      price: price,
      title: title,
      imageCover: imageCover,
      id: id,
      updatedAt: updatedAt,
      createdAt: createdAt,
      v: v,
      slug: slug,
      sold: sold,
      ratingsQuantity: ratingsQuantity,
      quantity: quantity,
      images: images,
      ratingsAverage: ratingsAverage,
      description: description,
      category: category?.toCategory(),
      brand: brand?.toCategory(),
      subcategory: subcategory
          ?.map((subcategoryDto) => subcategoryDto.toSubcategory())
          .toList(),
    );
  }
}
