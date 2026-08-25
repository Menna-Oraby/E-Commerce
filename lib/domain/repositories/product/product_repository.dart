import 'package:e_commerce/domain/entities/response/product.dart';

abstract class ProductRepository {
 Future<List<Product>?> getAllProducts();
}