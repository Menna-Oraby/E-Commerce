import 'package:e_commerce/api/mapper/auth_response_mapper.dart';
import 'package:e_commerce/api/mapper/login_request_mapper.dart';
import 'package:e_commerce/api/mapper/register_request_mapper.dart';
import 'package:e_commerce/api/web_services.dart';
import 'package:e_commerce/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce/domain/entities/request/login_request_dto.dart';
import 'package:e_commerce/domain/entities/request/register_request_dto.dart';
import 'package:e_commerce/domain/entities/response/auth_response_dto.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  WebServices webServices;
  AuthRemoteDataSourceImpl({required this.webServices});


  @override
  Future<AuthResponseDto> login(LoginRequestDto loginRequest) async{
    var authRemoteResponse = await webServices.login(loginRequest.toLoginRequest());
    return authRemoteResponse.toAuthResponseDto();
  }

  @override
  Future<AuthResponseDto> register(RegisterRequestDto registerRequest) async{
   var authResponse = await webServices.register(registerRequest.toRegisterRequest());
   return authResponse.toAuthResponseDto();
  }
}