import 'package:e_commerce/domain/entities/response/wishlist_action_response.dart';
import 'package:e_commerce/domain/repositories/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddToWishlistUseCase {
  WishlistRepository wishlistRepository;
  AddToWishlistUseCase({required this.wishlistRepository});

  Future<WishlistActionResponse> invoke(String productId){
    return wishlistRepository.addToWishlist(productId);

  }
}