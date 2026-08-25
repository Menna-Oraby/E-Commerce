import 'package:e_commerce/api/mapper/get_wishlist_mapper.dart';
import 'package:e_commerce/api/model/response/wishlist/get_wishlist/get_wishlist_response_dto.dart';
import 'package:e_commerce/domain/entities/response/get_wishlist_response.dart';

extension GetWishlistResponseMapper on GetWishlistResponseDto {
  GetWishlistResponse toGetWishlistResponse() {
    return GetWishlistResponse(
      status: status,
      count: count,
      data: data
          ?.map((getWishlistDto) => getWishlistDto.toGetWishlist())
          .toList(),
    );
  }
}
