import 'package:e_commerce/domain/entities/response/metadata.dart';
import 'package:e_commerce/domain/entities/response/product.dart';

class ProductResponse {
  final int? results;
  final Metadata? metadata;
  final List<Product>? data;

  ProductResponse ({
    this.results,
    this.metadata,
    this.data,
  });


}