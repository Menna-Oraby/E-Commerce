import 'package:e_commerce/api/model/request/register_request.dart';
import 'package:e_commerce/domain/entities/request/register_request_dto.dart';

extension RegisterRequestMapper on RegisterRequestDto{
  RegisterRequest toRegisterRequest(){
    return RegisterRequest(
      name: name ,email:email ,password:password ,phone:phone ,rePassword:rePassword
    );
  }
}