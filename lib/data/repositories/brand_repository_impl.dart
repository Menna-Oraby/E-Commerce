import 'package:e_commerce/data/data_sources/remote/brand_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/category.dart';
import 'package:e_commerce/domain/repositories/brand/brand_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BrandRepository)
class BrandRepositoryImpl implements BrandRepository{
  BrandRemoteDataSource brandRemoteDataSource;
  BrandRepositoryImpl({required this.brandRemoteDataSource});
  @override
  Future<List<Category>?> getAllBrands() {
    return brandRemoteDataSource.getAllBrands();
  }
}