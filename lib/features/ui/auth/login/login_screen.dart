import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routs.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:e_commerce/features/ui/auth/states/auth_states.dart';
import 'package:e_commerce/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(
    text: "menna200@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "18061718@A",
  );

  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, AuthStates>(
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
            message: "Login Successfully",
            title: "Success",
            posActionName: "Ok",
            posAction: (){
              SharedPrefsUtils.saveData(key: 'token', value: state.authResponse.token);
              Navigator.of(context).pushReplacementNamed(AppRouts.home);
            }
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
                    top: 91.h,
                    bottom: 87.h,
                    left: 97.w,
                    right: 97.w,
                  ),
                  child: Image.asset(AppAssets.routeLogo),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AutoSizeText(
                        'Welcome Back To Route',
                        style: AppStyles.semi24White,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        'please sign in with your mail',
                        style: AppStyles.light16White,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('User Name', style: AppStyles.medium18White),
                              CustomTextFormField(
                                hintText: 'enter your name',
                                controller: emailController,
                                validator: AppValidators.validateEmail,
                                keyBoardType: TextInputType.emailAddress,
                                isPassword: false,
                              ),
                              Text('Password', style: AppStyles.medium18White),

                              CustomTextFormField(
                                hintText: 'enter your password',
                                controller: passwordController,
                                validator: AppValidators.validatePassword,
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.visibility_off),
                                ),
                                keyBoardType: TextInputType.visiblePassword,
                                obscureText: true,
                                isPassword: true,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forget Password',
                                  style: AppStyles.medium18White,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: CustomElevatedButton(
                                  backgroundColor: AppColors.whiteColor,
                                  text: 'Login',
                                  textStyle: AppStyles.semi20Primary,
                                  onPressed: () {
                                    viewModel.login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.h),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      AppRouts.register,
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Don’t have an account? Create Account',
                                          style: AppStyles.medium18White
                                              .copyWith(fontSize: 16),
                                          textAlign: TextAlign.center,
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
                    ],
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
