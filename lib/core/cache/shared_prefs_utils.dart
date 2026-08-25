import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {

 static late SharedPreferences sharedPref ;

 static Future<SharedPreferences> init()async{
   return sharedPref = await SharedPreferences.getInstance();
 }


 //save data
static Future<bool> saveData ({required String key, required dynamic value})async{
   if(value is int){
     return await sharedPref.setInt(key, value);
   }else if (value is String){
     return await sharedPref.setString(key, value);
   }else if (value is double){
     return await sharedPref.setDouble(key, value);
   }else{
     return await sharedPref.setBool(key, value);
   }
}
static Object? getData({required String key}){
  return sharedPref.get(key);
}
static Future<bool> removeData({required String key})async{
   return await sharedPref.remove(key);
}

}