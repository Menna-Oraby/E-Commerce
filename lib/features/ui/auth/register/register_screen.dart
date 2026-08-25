import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:e_commerce/features/ui/auth/states/auth_states.dart';
import 'package:e_commerce/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController(
    text: 'ali dekheel',
  );
  TextEditingController mobileNumController = TextEditingController(
    text: '01100860890',
  );
  TextEditingController emailController = TextEditingController(
    text: 'adasdf@fds.com',
  );
  TextEditingController passController = TextEditingController(
    text: '15261548@A',
  );
  TextEditingController rePassController = TextEditingController(
    text: '15261548@A',
  );
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Waiting...');
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.message,
            title: "Error",
            posActionName: "Ok",
          );
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: "Register Successfully",
            title: "Success",
            posActionName: "Ok",
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blueColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 85.h,
                    left: 97.w,
                    right: 97.w,
                    bottom: 47.h,
                  ),
                  child: Image.asset(AppAssets.routeLogo),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Full Name', style: AppStyles.medium18White),
                        CustomTextFormField(
                          hintText: 'enter your full name',
                          controller: fullNameController,
                          validator: AppValidators.validateFullName,
                        ),
                        Text('Mobile Number', style: AppStyles.medium18White),
                        CustomTextFormField(
                          hintText: 'enter your mobile number',
                          controller: mobileNumController,
                          validator: AppValidators.validatePhoneNumber,
                          keyBoardType: TextInputType.phone,
                        ),
                        Text('E-mail address', style: AppStyles.medium18White),
                        CustomTextFormField(
                          hintText: 'enter your email address',
                          controller: emailController,
                          validator: AppValidators.validateEmail,
                          keyBoardType: TextInputType.emailAddress,
                        ),
                        Text('Password', style: AppStyles.medium18White),
                        CustomTextFormField(
                          hintText: 'enter your full password',
                          controller: passController,
                          validator: AppValidators.validatePassword,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.visibility_off),
                          ),
                          obscureText: true,
                          keyBoardType: TextInputType.visiblePassword,
                        ),
                        Text('RePassword', style: AppStyles.medium18White),
                        CustomTextFormField(
                          hintText: ' rePassword',
                          controller: rePassController,
                          validator: (val) =>
                              AppValidators.validateConfirmPassword(
                                val,
                                passController.text,
                              ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.visibility_off),
                          ),
                          obscureText: true,
                          keyBoardType: TextInputType.visiblePassword,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 56.h),
                          child: CustomElevatedButton(
                            backgroundColor: AppColors.whiteColor,
                            text: 'Sign up',
                            textStyle: AppStyles.semi20Primary,
                            onPressed: () {
                              viewModel.register(
                                email: emailController.text,
                                password: passController.text,
                                rePassword: rePassController.text,
                                phone: mobileNumController.text,
                                name: fullNameController.text,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
