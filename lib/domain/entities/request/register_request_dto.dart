 class RegisterRequestDto {
   String? email;
   String? password;
   String? name;
   String? rePassword;
   String? phone;
   RegisterRequestDto({required this.email , required this.password,
     required this.phone , required this.name ,required this.rePassword});
 }