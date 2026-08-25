
abstract final class AppValidators{
  AppValidators._();

 static String? validateEmail(String? val){
   RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
   if (val == null || val.trim().isEmpty){
     return 'this field is required';
   }
   else if (emailRegExp.hasMatch(val) == false){
     return 'enter valid email';
   }
   else {return null;}
 }
static String? validatePassword(String? val){
   RegExp passwordRegExp = RegExp(  r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
   if (val == null || val.isEmpty){
return 'this field is required';
   }
   else if (passwordRegExp.hasMatch(val) == false){
     return 'enter valid password';
   }
   else {return null;}
}
static String? validateConfirmPassword(String? val , String? password){
  if (val == null || val.isEmpty){
    return 'this field is required';
  }
  else if (val != password){
    return 'passwords not matching ';
  }
  else{
    return null;
  }
}
static String? validateUsername(String? val){
   RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9,.-]+$');
   if (val == null || val.isEmpty){
     return 'this field is required';
   }

   else if(usernameRegExp.hasMatch(val) == false){
     return 'enter valid username';
   }
   else {return null;}
}
static String? validateFullName(String? val){
   if (val == null || val.isEmpty){
     return 'this field is required';
   }
   else {return null;}
}
static String? validatePhoneNumber(String? val){
if  (val == null){
  return 'this field is required';
}
else if(int.tryParse(val.trim()) == null){
  return 'enter numbers only';
}
else if (val.trim().length != 11){
  return 'enter value must equal 11 digit' ;
}
else{return null ;}
}
}
