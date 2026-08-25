import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
typedef OnValidator = String? Function(String?)?;

class CustomTextFormField extends StatefulWidget {
  Color borderColor;
  String? hintText;
  TextStyle? hintStyle;
  String? labelText;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText;
  Color filledColor;
  TextStyle? textStyle;
  OnValidator validator;
  TextInputType keyBoardType;
  TextEditingController? controller;
  bool readOnly;
  bool isPassword; //

   CustomTextFormField({super.key, this.borderColor = AppColors.whiteColor, this.hintText
   ,this.hintStyle,this.labelStyle,this.labelText ,this.prefixIcon,this.suffixIcon
     ,this.filledColor = AppColors.whiteColor, this.validator, this.controller ,
     this.keyBoardType = TextInputType.text, this.obscureText = false,
   this.textStyle,this.readOnly = false, this.isPassword = false});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 12.h,bottom: 20.h), // change padding,,,and color
      child: TextFormField(
        decoration:InputDecoration(
          enabledBorder: buildDecorationBorder(borderColor: widget.borderColor)
            ,  focusedBorder: buildDecorationBorder(borderColor: widget.borderColor),
          errorBorder: buildDecorationBorder(borderColor: AppColors.redColor),
          focusedErrorBorder: buildDecorationBorder(borderColor: AppColors.redColor),
              hintText: widget.hintText ,
          errorStyle: AppStyles.medium14Category.copyWith(color: AppColors.redColor),
          hintStyle: widget.hintStyle?? AppStyles.light18HintText
            ,labelText: widget.labelText,
          labelStyle: widget.labelStyle ?? AppStyles.light18HintText,
          prefixIcon: widget.prefixIcon
            ,suffixIcon: widget.suffixIcon,
          fillColor: widget.filledColor,
          filled: true

        ),
        validator: widget.validator ,
        controller: widget.controller,
        keyboardType: widget.keyBoardType,
        obscureText: widget.obscureText,
        style: widget.textStyle,
        readOnly:widget.readOnly ,

      ),
    );
  }
}
OutlineInputBorder buildDecorationBorder({required Color borderColor }){
  return  OutlineInputBorder(
      borderRadius:BorderRadius.circular(15),
      borderSide:BorderSide(
          color:borderColor,
          width: 1
      )
  );
}