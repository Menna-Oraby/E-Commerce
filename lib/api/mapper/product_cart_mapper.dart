import 'package:e_commerce/api/model/response/cart/product_cart_dto.dart';
import 'package:e_commerce/domain/entities/response/product_cart.dart';

extension ProductCartMapper on ProductCartDto{
  ProductCart toProductCart(){
     return ProductCart(id: id,
     price: price,
     count: count,
     product: product);
  }
}