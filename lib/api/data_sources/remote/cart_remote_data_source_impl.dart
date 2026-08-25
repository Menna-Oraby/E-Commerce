import 'package:dio/dio.dart';
import 'package:e_commerce/api/mapper/add_cart_response_mapper.dart';
import 'package:e_commerce/api/mapper/get_cart_response_mapper.dart';
import 'package:e_commerce/api/model/request/count_request_dto.dart';
import 'package:e_commerce/api/model/request/product_request_dto.dart';
import 'package:e_commerce/api/web_services.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/add_cart_response.dart';
import 'package:e_commerce/domain/entities/response/get_cart_response.dart';
import 'package:injectable/injectable.dart';

import '../../../core/exceptions/app_exception.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  WebServices webServices;

  CartRemoteDataSourceImpl({required this.webServices});

  @override
  Future<AddCartResponse> addToCart(String productId) async {
    try {
      ProductRequestDto productRequest = ProductRequestDto(
        productId: productId,
      );
      String? token = SharedPrefsUtils.getData(key: 'token') as String?;
      var addCartResponse = await webServices.addToCart(
        productRequest,
        token ?? "",
      );
      return addCartResponse.toAddCartResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> getItemsInCart() async {
    try {
      String? token = SharedPrefsUtils.getData(key: 'token') as String?;
      var getCartResponse = await webServices.getCart(token ?? '');
      return getCartResponse.toGetCartResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> deleteItemsInCart(String productId) async {
    try {
      String? token = SharedPrefsUtils.getData(key: 'token') as String?;
      var deleteCartResponse = await webServices.deleteItemsInCart(
          productId, token ?? '');
      return deleteCartResponse.toGetCartResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> updateCountInCart(String productId, int count) async {
    try {
      String? token = SharedPrefsUtils.getData(key: 'token') as String?;
      CountRequestDto countRequest = CountRequestDto(count: '$count');
      var updateCartResponse = await webServices.updateCountInCart(
          productId, token ?? '', countRequest);
      return updateCartResponse.toGetCartResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}