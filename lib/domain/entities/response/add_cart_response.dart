
import 'package:e_commerce/domain/entities/response/cart.dart';

class AddCartResponse {
  final String? status;
  final String? message;
  final int? numOfCartItems;
  final String? cartId;
  final Cart? data;

  AddCartResponse ({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });


}






