import 'package:e_commerce/domain/entities/response/get_cart_response.dart';
import 'package:e_commerce/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class UpdateCountInCartUseCase {
  CartRepository cartRepository;
  UpdateCountInCartUseCase({required this.cartRepository});

  Future<GetCartResponse> invoke(String productId,int count){
    return cartRepository.updateCountInCart(productId, count);
  }
}