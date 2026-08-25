import 'package:e_commerce/api/mapper/category_mapper.dart';
import 'package:e_commerce/api/mapper/subcategory_mapper.dart';
import 'package:e_commerce/api/model/response/common/product_dto.dart';
import 'package:e_commerce/domain/entities/response/product.dart';

extension ProductMapper on ProductDto {
  Product toProduct() {
    return Product(
      id: id,
      slug: slug,
      title: title,
      brand: brand?.toCategory(),
      category: category?.toCategory(),
      createdAt: createdAt,
      description: description,
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      subcategory: subcategory
          ?.map((subcategoryDto) => subcategoryDto.toSubcategory())
          .toList(),
      updatedAt: updatedAt,
    );
  }
}
