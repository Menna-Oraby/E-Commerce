import 'package:dio/dio.dart';
import 'package:e_commerce/api/mapper/category_mapper.dart';
import 'package:e_commerce/api/web_services.dart';
import 'package:e_commerce/core/exceptions/app_exception.dart';
import 'package:e_commerce/data/data_sources/remote/category_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  WebServices webServices;
  CategoryRemoteDataSourceImpl({required this.webServices});
  @override
  Future<List<Category>?> getAllCategories() async {
    try{
      var categoryResponse = await webServices.getAllCategories();
      return categoryResponse.data
          ?.map((categoryDto) => categoryDto.toCategory())
          .toList() ??
          [];
    }on DioException catch(e){
      String message= (e.error as AppException).message;
      throw ServerException(message: message);

    }
  }
}
