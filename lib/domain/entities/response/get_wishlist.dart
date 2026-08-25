import 'package:e_commerce/domain/entities/response/category.dart';
import 'package:e_commerce/domain/entities/response/subcategory.dart';

class GetWishlist {
  final int? sold;
  final List<String>? images;
  final List<Subcategory>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final Category? category;
  final Category? brand;
  final double? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  GetWishlist({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
}
