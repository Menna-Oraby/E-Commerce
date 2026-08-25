import 'package:e_commerce/data/data_sources/remote/wishlist_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/get_wishlist_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist_action_response.dart';
import 'package:e_commerce/domain/repositories/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository{
  WishlistRemoteDataSource remoteDataSource;
  WishlistRepositoryImpl({required this.remoteDataSource});
  @override
  Future<WishlistActionResponse> addToWishlist(String productId) {
   return remoteDataSource.addToWishlist(productId);
  }

  @override
  Future<GetWishlistResponse> getItemsInWishlist() {
    return remoteDataSource.getItemsInWishlist();
  }
}