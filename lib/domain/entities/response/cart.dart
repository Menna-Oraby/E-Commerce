
import 'package:e_commerce/domain/entities/response/product_cart.dart';

class Cart {
  final String? id;
  final String? cartOwner;
  final List<ProductCart>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  Cart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });


}