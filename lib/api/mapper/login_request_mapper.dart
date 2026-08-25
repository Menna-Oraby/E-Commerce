import 'package:e_commerce/api/model/request/login_request.dart';
import 'package:e_commerce/domain/entities/request/login_request_dto.dart';

extension LoginRequestMapper on LoginRequestDto{
  LoginRequest toLoginRequest(){
   return LoginRequest(email: email,password: password);
  }
}