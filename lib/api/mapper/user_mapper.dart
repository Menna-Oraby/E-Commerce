import 'package:e_commerce/api/model/response/user.dart';
import 'package:e_commerce/domain/entities/response/user_dto.dart';

extension UserMapper on User{
  UserDto toUserDto(){
    return  UserDto(name: name, email: email);
  }
}