
import 'package:e_commerce/core/exceptions/app_exception.dart';
import 'package:e_commerce/domain/entities/response/get_wishlist.dart';
import 'package:e_commerce/domain/use_cases/add_to_wishlist_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_wishlist_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class FavoriteTabViewModel extends Cubit<FavoriteTabStates>{
  AddToWishlistUseCase addToWishlistUseCase;
  GetWishlistUseCase getWishlistUseCase;
  FavoriteTabViewModel({required this.addToWishlistUseCase,required this.getWishlistUseCase}):super(FavoriteTabInitialState());
  static FavoriteTabViewModel get(context) =>BlocProvider.of<FavoriteTabViewModel>(context) ;
  List<GetWishlist> wishlist=[];
  Future<void> addToWishlist({required String productId})async {
    try{
     await addToWishlistUseCase.invoke(productId);
      emit(AddFavoriteTabSuccessState());
    }on AppException catch (e){
      emit(AddFavoriteTabErrorState(message: e.message));
    }
  }

  Future<void> getWishList()async{
    emit(GetFavoriteTabLoadingState());
   try {
     var getWishlist = await getWishlistUseCase.invoke();
     wishlist = getWishlist.data!;
     emit(GetFavoriteTabSuccessState(getWishlist: wishlist));
   }on AppException catch (e){
     emit(AddFavoriteTabErrorState(message: e.message));
   }
  }
}