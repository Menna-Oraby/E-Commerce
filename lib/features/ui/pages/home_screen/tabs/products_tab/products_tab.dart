import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/core/utils/app_routs.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:e_commerce/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerce/features/ui/widgets/main_error_widget.dart';
import 'package:e_commerce/features/ui/widgets/main_loading_widget.dart';
import 'package:e_commerce/features/ui/widgets/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  ProductTabViewModel viewModel = getIt<ProductTabViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteTabViewModel, FavoriteTabStates>(
      listener: (context, state) {
        if(state is AddFavoriteTabSuccessState){
          DialogUtils.showSnackBar(
              context: context, message: 'Product Added Successfully to your Favorite list');
        }
        if(state is AddFavoriteTabErrorState){
          DialogUtils.showSnackBar(context: context, message: state.message,);
        }
      },
      child: BlocListener<CartViewModel, CartStates>(
        listener: (context, state) {
          if (state is AddCartSuccessState) {
            DialogUtils.showSnackBar(
                context: context, message: 'Added items Successfully');
          } else if (state is AddCartErrorState) {
            DialogUtils.showSnackBar(context: context, message: state.message,);
          }
        },
        child: BlocBuilder(
          bloc: viewModel,
          builder: (context, state) {
            if (state is ProductErrorState) {
              return MainErrorWidget(messageError: state.message);
            } else if (state is ProductSuccessState) {
              return SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                          childAspectRatio: 2 / 2.8.h,
                        ),
                        itemCount: state.productsList!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRouts.product,
                                  arguments: state.productsList![index]);
                            },
                            child: ProductTabItem(
                              product: state.productsList![index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const MainLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
