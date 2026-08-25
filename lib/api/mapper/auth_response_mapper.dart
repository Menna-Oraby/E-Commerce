import 'package:e_commerce/api/mapper/user_mapper.dart';
import 'package:e_commerce/api/model/response/auth_response.dart';
import 'package:e_commerce/core/exceptions/app_exception.dart';
import 'package:e_commerce/domain/entities/response/auth_response_dto.dart';

extension AuthResponseMapper on AuthResponse {
  AuthResponseDto toAuthResponseDto() {
    if (user != null  && token != null && token!.isNotEmpty) {
      return AuthResponseDto(userDto: user!.toUserDto(), token: token);
    }
    throw ServerException(message: 'Failed Authentication');
  }
}
