import 'package:e_commerce/api/mapper/get_cart_mapper.dart';
import 'package:e_commerce/api/model/response/cart/get_cart/get_cart_response_dto.dart';
import 'package:e_commerce/domain/entities/response/get_cart_response.dart';

extension GetCartResponseMapper on GetCartResponseDto{
  GetCartResponse toGetCartResponse(){
    return GetCartResponse(
      numOfCartItems: numOfCartItems,
      status: status,
      cartId: cartId,
      data: data!.toGetCart()
    );
  }
}