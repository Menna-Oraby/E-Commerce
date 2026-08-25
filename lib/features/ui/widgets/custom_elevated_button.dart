import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  Color backgroundColor;
  String text;
  TextStyle textStyle;
  void Function()? onPressed;
   CustomElevatedButton({super.key, required this.backgroundColor,required this.text, required this.textStyle,
   required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(

          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(
              Radius.circular(15.r)
            )
          )
        ),
        child:SizedBox(
          height: 64.h,
          width: 398.w,
          child: Center(
            child: Text(text,style: textStyle,),
          ),
        ) );
  }
}
