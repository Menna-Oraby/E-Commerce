import 'package:e_commerce/api/model/response/product/sub_category_dto.dart';
import 'package:e_commerce/domain/entities/response/subcategory.dart';

extension SubcategoryMapper on SubcategoryDto {
  Subcategory toSubcategory() {
    return Subcategory(category: category, slug: slug, id: id, name: name);
  }
}
