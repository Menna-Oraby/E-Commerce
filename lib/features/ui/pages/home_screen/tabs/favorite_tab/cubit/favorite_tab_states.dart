import 'package:e_commerce/domain/entities/response/get_wishlist.dart';

abstract class FavoriteTabStates {}
class FavoriteTabInitialState extends FavoriteTabStates{}
class AddFavoriteTabLoadingState extends FavoriteTabStates{}
class AddFavoriteTabErrorState extends FavoriteTabStates{
  String message;
  AddFavoriteTabErrorState({required this.message});
}
class AddFavoriteTabSuccessState extends FavoriteTabStates{}

class GetFavoriteTabLoadingState extends FavoriteTabStates{}
class GetFavoriteTabErrorState extends FavoriteTabStates{
  String message;
  GetFavoriteTabErrorState({required this.message});
}
class GetFavoriteTabSuccessState extends FavoriteTabStates{
  List<GetWishlist> getWishlist;
  GetFavoriteTabSuccessState({required this.getWishlist});
}