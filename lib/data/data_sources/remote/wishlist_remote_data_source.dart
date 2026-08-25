import '../../../domain/entities/response/get_wishlist_response.dart';
import '../../../domain/entities/response/wishlist_action_response.dart';

abstract class WishlistRemoteDataSource {
  Future <WishlistActionResponse> addToWishlist(String productId);
  Future <GetWishlistResponse> getItemsInWishlist();
}