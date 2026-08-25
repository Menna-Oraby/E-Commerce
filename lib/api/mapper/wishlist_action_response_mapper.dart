import 'package:e_commerce/api/model/response/wishlist/wishlist_action_response_dto.dart';
import 'package:e_commerce/domain/entities/response/wishlist_action_response.dart';

extension WishlistActionResponseMapper on WishlistActionResponseDto{
  WishlistActionResponse toWishlistActionResponse(){
    return WishlistActionResponse(
      message: message,
      data: data,
       status: status
    );
  }
}