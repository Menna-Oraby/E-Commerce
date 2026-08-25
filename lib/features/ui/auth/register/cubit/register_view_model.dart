import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/exceptions/app_exception.dart';
import 'package:e_commerce/domain/entities/request/register_request_dto.dart';
import 'package:e_commerce/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/features/ui/auth/states/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates> {
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase})
    : super(AuthInitialState());
  var formKey = GlobalKey<FormState>();

  void register({
    required String email,
    required String password,
    required String rePassword,
    required String phone,
    required String name,
  }) async {
    if (formKey.currentState!.validate() == true) {
      try {
        emit(AuthLoadingState());
        var registerRequest = RegisterRequestDto(
          email: email,
          password: password,
          phone: phone,
          name: name,
          rePassword: rePassword,
        );
        var response = await registerUseCase.invoke(registerRequest);
        emit(AuthSuccessState(authResponse: response));
      } on AppException catch (e) {
        emit(AuthErrorState(message: e.message));
      } on DioException catch (e) {
        var message = (e.error is AppException)
            ? (e.error as AppException).message
            : 'unExpected occurred';
        emit(AuthErrorState(message: message));
      }
    }
  }
}
