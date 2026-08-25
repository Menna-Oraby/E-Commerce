import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_endpoints.dart';
import 'package:e_commerce/api/model/request/count_request_dto.dart';
import 'package:e_commerce/api/model/request/login_request.dart';
import 'package:e_commerce/api/model/request/product_request_dto.dart';
import 'package:e_commerce/api/model/request/register_request.dart';
import 'package:e_commerce/api/model/response/auth_response.dart';
import 'package:e_commerce/api/model/response/brand/brand_response_dto.dart';
import 'package:e_commerce/api/model/response/cart/add_cart_response_dto.dart';
import 'package:e_commerce/api/model/response/cart/get_cart/get_cart_response_dto.dart';
import 'package:e_commerce/api/model/response/category/category_response_dto.dart';
import 'package:e_commerce/api/model/response/product/product_response_dto.dart';
import 'package:e_commerce/api/model/response/wishlist/get_wishlist/get_wishlist_response_dto.dart';
import 'package:e_commerce/api/model/response/wishlist/wishlist_action_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST(ApiEndpoints.loginApi)
   Future<AuthResponse>login(@Body() LoginRequest loginRequest);

  @POST(ApiEndpoints.registerApi)
  Future<AuthResponse>register(@Body() RegisterRequest registerRequest);

@GET(ApiEndpoints.categoriesApi)
 Future<CategoryResponseDto> getAllCategories();

  @GET(ApiEndpoints.brandsApi)
  Future<BrandResponseDto> getAllBrands();

  @GET(ApiEndpoints.productsApi)
  Future<ProductResponseDto> getAllProducts();

  @POST(ApiEndpoints.addCartApi)
Future<AddCartResponseDto> addToCart(@Body() ProductRequestDto productRequest
  ,@Header('token') String token );


  @GET(ApiEndpoints.addCartApi)
  Future<GetCartResponseDto> getCart(@Header('token') String token );



  @DELETE(ApiEndpoints.deleteCartApi)
  Future<GetCartResponseDto> deleteItemsInCart(
      @Path() String productId,
      @Header('token') String token
      );

  @PUT(ApiEndpoints.deleteCartApi)
  Future<GetCartResponseDto> updateCountInCart(
      @Path() String productId,
      @Header('token') String token,
      @Body() CountRequestDto countRequest
      );

  @POST(ApiEndpoints.addWishlistApi)
  Future<WishlistActionResponseDto> addToWishlist(
      @Body() ProductRequestDto productRequest,
      @Header('token') String token
      );

@GET(ApiEndpoints.addWishlistApi)
  Future<GetWishlistResponseDto> getWishlist(@Header('token') String token);

}


