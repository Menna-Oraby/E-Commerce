import 'package:e_commerce/api/mapper/product_cart_mapper.dart';
import 'package:e_commerce/api/model/response/cart/cart_dto.dart';
import 'package:e_commerce/domain/entities/response/cart.dart';

extension CartMapper on CartDto{
  Cart toCart(){
    return Cart(
      id: id,
      updatedAt: updatedAt,
      createdAt: createdAt,
      cartOwner: createdAt,
       v: v,
      totalCartPrice: totalCartPrice,
      products: products?.map((productCartDto)=> productCartDto.toProductCart()).toList()??[]
    );
  }
}