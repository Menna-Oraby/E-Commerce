import 'package:e_commerce/domain/entities/request/login_request_dto.dart';
import 'package:e_commerce/domain/entities/response/auth_response_dto.dart';
import 'package:e_commerce/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<AuthResponseDto> invoke (LoginRequestDto loginRequest){
    return authRepository.login(loginRequest);
  }
}