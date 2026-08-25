import 'package:bloc/bloc.dart';
import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/config/my_bloc_observer.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/utils/app_routs.dart';
import 'package:e_commerce/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce/features/ui/auth/register/register_screen.dart';
import 'package:e_commerce/features/ui/pages/cart_screen/cart_screen.dart';
import 'package:e_commerce/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce/features/ui/pages/home_screen/home_screen.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'package:e_commerce/features/ui/pages/product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPrefsUtils.init();
  String routName;
  var token = SharedPrefsUtils.getData(key: 'token');
  if (token == null) {
    routName = AppRouts.login;
  } else {
    routName = AppRouts.home;
  }
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CartViewModel>()),
        BlocProvider(create: ((context) => getIt<FavoriteTabViewModel>())),
      ],
      child: MyApp(routName: routName),
    ),
  );
}

class MyApp extends StatelessWidget {
  String routName;
  MyApp({required this.routName});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: routName,
          routes: {
            AppRouts.login: (_) => LoginScreen(),
            AppRouts.register: (_) => RegisterScreen(),
            AppRouts.home: (_) => HomeScreen(),
            AppRouts.product: (_) => ProductDetailsScreen(),
            AppRouts.cart: (_) => CartScreen(),
          },
        );
      },
    );
  }
}
