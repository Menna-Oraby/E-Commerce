import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'package:e_commerce/features/ui/widgets/custom_app_bar_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartViewModel.get(context).getCart();
    FavoriteTabViewModel.get(context).getWishList();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
  builder: (context, state) {
    return Scaffold(
      appBar: _buildAppBar(viewModel.selectedIndex),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: viewModel.bodyList[viewModel.selectedIndex],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: viewModel.selectedIndex,
            onTap:viewModel.bottomNavOnTap,
            iconSize: 24.sp,
            items: [_bottomNavigationBarItemBuilder(isSelected: viewModel.selectedIndex == 0
                , selectedIcon: AppAssets.selectedHomeIcon,
                unselectedIcon: AppAssets.unSelectedHomeIcon),
              _bottomNavigationBarItemBuilder(isSelected: viewModel.selectedIndex == 1
                , selectedIcon: AppAssets.selectedCategoryIcon,
                unselectedIcon: AppAssets.unSelectedCategoryIcon),
              _bottomNavigationBarItemBuilder(isSelected: viewModel.selectedIndex == 2
                  , selectedIcon: AppAssets.selectedFavouriteIcon,
                  unselectedIcon: AppAssets.unSelectedFavouriteIcon),
              _bottomNavigationBarItemBuilder(isSelected: viewModel.selectedIndex == 3
                  , selectedIcon: AppAssets.selectedAccountIcon,
                  unselectedIcon: AppAssets.unSelectedAccountIcon),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}

BottomNavigationBarItem _bottomNavigationBarItemBuilder({
  required bool isSelected,
  required String selectedIcon,
  required unselectedIcon,
}) {
  return BottomNavigationBarItem(
    icon: CircleAvatar(
      foregroundColor: isSelected
          ? AppColors.primaryColor
          : AppColors.whiteColor,
      backgroundColor: isSelected ? AppColors.whiteColor : Colors.transparent,
      radius: 25.r,
      child: Image.asset(isSelected ? selectedIcon : unselectedIcon),
    ),
    label: ''
  );
}
  PreferredSizeWidget _buildAppBar(int index){
  return AppBar(
    surfaceTintColor: AppColors.transparentColor,
    elevation: 0,
    toolbarHeight: index!=3 ? 120.h : kToolbarHeight,
    leadingWidth: double.infinity,
    leading: Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w,vertical: 10.h),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(bottom:10.h),
          child: Image.asset(
            AppAssets.smallRoutLogo,width: 66.w,height: 22.h,),
        ),
        Visibility(visible: index !=3,
            child: Expanded(child: Row(
              children: [
                Expanded(child: TextField(
                  style: AppStyles.regular14Text,
                  cursorColor: AppColors.primaryColor,
                  onTap: (){},
                  decoration: InputDecoration(
                    border: _buildDecorationBorder(),
                    enabledBorder: _buildDecorationBorder(),
                    focusedBorder: _buildDecorationBorder(),
                    hintText: 'what do you search for',
                    hintStyle: AppStyles.light14SearchHint,
                    prefixIcon: Icon(
                      Icons.search,
                      size:  30.sp,
                      color: AppColors.primaryColor,
                    )
                  ),
                )),
                 CustomAppBarBadge()
              ],
            ))),
      ],
    ),),
    



  );
  }
OutlineInputBorder _buildDecorationBorder(){
  return  OutlineInputBorder(
      borderRadius:BorderRadius.circular(15),
      borderSide:BorderSide(
          color:AppColors.primaryColor,
          width: 1
      )
  );}