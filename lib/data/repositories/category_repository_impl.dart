import 'package:e_commerce/data/data_sources/remote/category_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/category.dart';
import 'package:e_commerce/domain/repositories/category/category_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository{
  CategoryRemoteDataSource remoteDataSource;
  CategoryRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<Category>?> getAllCategories() {
    return remoteDataSource.getAllCategories();
  }
}