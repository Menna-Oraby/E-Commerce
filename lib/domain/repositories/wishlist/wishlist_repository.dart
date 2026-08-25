import 'package:e_commerce/domain/entities/response/get_wishlist_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist_action_response.dart';

abstract class WishlistRepository {
  Future <WishlistActionResponse> addToWishlist(String productId);
  Future <GetWishlistResponse> getItemsInWishlist();

}