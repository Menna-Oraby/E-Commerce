import 'package:e_commerce/domain/entities/response/get_cart_response.dart';
import 'package:e_commerce/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCartUseCase {
  CartRepository cartRepository;
  GetCartUseCase({required this.cartRepository});

  Future<GetCartResponse> invoke(){
    return cartRepository.getItemsInCart();
  }
}