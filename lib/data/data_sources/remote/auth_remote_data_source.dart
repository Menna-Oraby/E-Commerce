import 'package:e_commerce/domain/entities/request/login_request_dto.dart';
import 'package:e_commerce/domain/entities/request/register_request_dto.dart';
import 'package:e_commerce/domain/entities/response/auth_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseDto>login(LoginRequestDto loginRequest);
  Future<AuthResponseDto>register(RegisterRequestDto registerRequest);

}