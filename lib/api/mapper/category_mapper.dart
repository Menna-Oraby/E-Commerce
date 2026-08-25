import 'package:e_commerce/api/model/response/category/category_dto.dart';
import 'package:e_commerce/domain/entities/response/category.dart';

extension CategoryMapper on CategoryDto {
  Category toCategory() {
    return Category(name: name, id: id, image: image, slug: slug);
  }
}
