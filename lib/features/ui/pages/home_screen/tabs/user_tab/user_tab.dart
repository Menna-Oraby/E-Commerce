import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routs.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AutoSizeText
                  ('Welcome, Mahmoud',style: AppStyles.medium18Header,),
                 Spacer(),
                IconButton(onPressed: (){
                  SharedPrefsUtils.removeData(key: 'token');
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRouts.login, (route) => false ,);
                }, icon:Icon(Icons.logout_outlined,color: AppColors.primaryColor,size: 30.r,) )
              ],
            ),
            AutoSizeText('mahmoud.N@gmail.com',style: AppStyles.medium14LightPrimary,)
            ,SizedBox(height: 40.h),
            AutoSizeText('Your full name',style: AppStyles.medium18Header,),
            CustomTextFormField(hintText: 'Mahmoud Ahmed Nabil',
            textStyle: AppStyles.medium14LightPrimary,
            suffixIcon:Icon(Icons.edit_outlined) ,
            borderColor: AppColors.primaryColor,),
            AutoSizeText('Your E-mail',style: AppStyles.medium18Header,),
            CustomTextFormField(hintText: 'mahmoud.N@gmail.com',
              textStyle: AppStyles.medium14LightPrimary,
              suffixIcon: Icon(Icons.edit_outlined),
            borderColor: AppColors.primaryColor,),
            AutoSizeText('Your Password',style: AppStyles.medium18Header,),
            CustomTextFormField(hintText: '************',
              textStyle: AppStyles.medium14LightPrimary,
              suffixIcon: Icon(Icons.edit_outlined),
              borderColor: AppColors.primaryColor,),
            AutoSizeText('Your mobile number',style: AppStyles.medium18Header,),
            CustomTextFormField(hintText: '0112211855',
              textStyle: AppStyles.medium14LightPrimary,
              suffixIcon: Icon(Icons.edit_outlined),
              borderColor: AppColors.primaryColor,),
            AutoSizeText('Your Address',style: AppStyles.medium18Header,),
            CustomTextFormField(hintText: '6th October,street11',
              textStyle: AppStyles.medium14LightPrimary,
              suffixIcon: Icon(Icons.edit_outlined),
              borderColor: AppColors.primaryColor,),
          ],
        ),
      ),
    );
  }
}
