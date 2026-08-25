import 'package:e_commerce/domain/entities/response/category.dart';

abstract class BrandRepository {
  Future<List<Category>?> getAllBrands();
}