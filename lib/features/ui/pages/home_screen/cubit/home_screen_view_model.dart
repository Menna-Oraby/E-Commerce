import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/home_tab.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/products_tab/products_tab.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/user_tab/user_tab.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel():super(HomeInitialState());
  int selectedIndex = 0;
  List<Widget> bodyList = [
     HomeTab(),
    ProductsTab(),
    FavoriteTab(),
    const UserTab(),
  ];
  void bottomNavOnTap(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndexState());
  }
}