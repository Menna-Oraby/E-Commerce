import 'package:dio/dio.dart';
import 'package:e_commerce/api/mapper/get_wishlist_response_mapper.dart';
import 'package:e_commerce/api/mapper/wishlist_action_response_mapper.dart';
import 'package:e_commerce/api/model/request/product_request_dto.dart';
import 'package:e_commerce/api/web_services.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/data/data_sources/remote/wishlist_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/get_wishlist_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist_action_response.dart';
import 'package:injectable/injectable.dart';

import '../../../core/exceptions/app_exception.dart';
@Injectable(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource{
  WebServices webServices;
  WishlistRemoteDataSourceImpl({required this.webServices});
  @override
  Future<WishlistActionResponse> addToWishlist(String productId)async {
    try{
      ProductRequestDto productRequest =ProductRequestDto(productId: productId);
      String? token= SharedPrefsUtils.getData(key: 'token') as String?;

     var addWishlistResponse= await webServices.addToWishlist(productRequest, token??'');
     return addWishlistResponse.toWishlistActionResponse();
    }on DioException catch(e){
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetWishlistResponse> getItemsInWishlist() async {
    try{
      String? token= SharedPrefsUtils.getData(key: 'token') as String?;

      var getWishlistResponse = await webServices.getWishlist(token??'');
      return getWishlistResponse.toGetWishlistResponse();
    }on DioException catch(e){
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}