import 'package:dio/dio.dart';
import 'package:e_commerce/api/mapper/category_mapper.dart';
import 'package:e_commerce/api/web_services.dart';
import 'package:e_commerce/core/exceptions/app_exception.dart';
import 'package:e_commerce/data/data_sources/remote/brand_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/category.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BrandRemoteDataSource)
class BrandRemoteDataSourceImpl implements BrandRemoteDataSource{
  WebServices webServices;
  BrandRemoteDataSourceImpl({required this.webServices});
  @override
  Future<List<Category>?> getAllBrands()async {
    try{
     var brandResponse= await  webServices.getAllBrands();
     return brandResponse.data?.map((categoryDto)=> categoryDto.toCategory()).toList() ??[];

    }on DioException catch(e){
      var message =(e.error as AppException).message;
      throw ServerException(message: message);

    }

  }
}