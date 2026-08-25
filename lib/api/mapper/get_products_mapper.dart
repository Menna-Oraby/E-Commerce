import 'package:e_commerce/api/mapper/product_mapper.dart';
import 'package:e_commerce/api/model/response/cart/get_cart/get_products_dto.dart';
import 'package:e_commerce/domain/entities/response/get_products.dart';

extension GetProductsMapper on GetProductsDto{
  GetProducts toGetProducts(){
    return GetProducts(
      id: id,
      count: count,
      price: price,
      product: product?.toProduct(),
    );
  }
}