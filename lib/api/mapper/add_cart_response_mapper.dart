import 'package:e_commerce/api/mapper/cart_mapper.dart';
import 'package:e_commerce/api/model/response/cart/add_cart_response_dto.dart';
import 'package:e_commerce/domain/entities/response/add_cart_response.dart';

extension AddCartResponseMapper on AddCartResponseDto{
  AddCartResponse toAddCartResponse(){
    return AddCartResponse(
      message: message,
      cartId: cartId,
      numOfCartItems: numOfCartItems,
      status: status ,
      data: data!.toCart()

    );
  }
}