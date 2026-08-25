import 'package:e_commerce/api/mapper/get_products_mapper.dart';
import 'package:e_commerce/api/model/response/cart/get_cart/get_cart_dto.dart';
import 'package:e_commerce/domain/entities/response/get_cart.dart';

extension GetCartMapper on GetCartDto {
  GetCart toGetCart() {
    return GetCart(
      id: id,
      totalCartPrice: totalCartPrice,
      v: v,
      cartOwner: createdAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      products:
          products
              ?.map((productsDto) => productsDto.toGetProducts())
              .toList() ??
          [],
    );
  }
}
