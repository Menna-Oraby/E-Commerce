import 'package:e_commerce/domain/entities/response/get_wishlist_response.dart';
import 'package:e_commerce/domain/repositories/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishlistUseCase {
  WishlistRepository wishlistRepository;
  GetWishlistUseCase({required this.wishlistRepository});
  Future<GetWishlistResponse> invoke() {
    return wishlistRepository.getItemsInWishlist();
  }
}
