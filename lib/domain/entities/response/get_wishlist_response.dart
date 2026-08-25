import 'package:e_commerce/domain/entities/response/get_wishlist.dart';

class GetWishlistResponse {
  final String? status;
  final int? count;
  final List<GetWishlist>? data;

  GetWishlistResponse({this.status, this.count, this.data});
}
