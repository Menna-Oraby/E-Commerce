import 'package:e_commerce/api/model/response/category/category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../product/sub_category_dto.dart';
part 'get_wishlist_dto.g.dart';
@JsonSerializable()
class GetWishlistDto {
  @JsonKey(name: "sold")
  final int? sold;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "subcategory")
  final List<SubcategoryDto>? subcategory;
  @JsonKey(name: "ratingsQuantity")
  final int? ratingsQuantity;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "imageCover")
  final String? imageCover;
  @JsonKey(name: "category")
  final CategoryDto? category;
  @JsonKey(name: "brand")
  final CategoryDto? brand;
  @JsonKey(name: "ratingsAverage")
  final double? ratingsAverage;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;


  GetWishlistDto ({
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

  factory GetWishlistDto.fromJson(Map<String, dynamic> json) {
    return _$GetWishlistDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetWishlistDtoToJson(this);
  }
}