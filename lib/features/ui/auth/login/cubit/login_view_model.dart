import 'package:dio/dio.dart';
import 'package:e_commerce/core/exceptions/app_exception.dart';
import 'package:e_commerce/domain/entities/request/login_request_dto.dart';
import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/features/ui/auth/states/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginViewModel extends Cubit<AuthStates>{
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}):super(AuthInitialState());

  var formKey = GlobalKey<FormState>();

  void login({required String email, required String password})async{
    if(formKey.currentState!.validate() == true){
       try{
         emit(AuthLoadingState());
         var loginRequest = LoginRequestDto(email: email, password: password);
         var response= await loginUseCase.invoke(loginRequest);
         emit(AuthSuccessState(authResponse: response));

       }on AppException catch(e){
         emit(AuthErrorState(message: e.message));

       }on DioException catch(e){
         final message = (e. error is AppException) ?
         (e.error as AppException).message : 'unExpected occurred';
         emit(AuthErrorState(message: message));
       }
    }
  }

}