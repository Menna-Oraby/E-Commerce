import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routs.dart';
import 'package:e_commerce/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:e_commerce/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBarBadge extends StatelessWidget {

  CustomAppBarBadge({super.key, });


  @override
  Widget build(BuildContext context) {
    final currentRout = ModalRoute
        .of(context)
        ?.settings
        .name;
    return InkWell(
      onTap: currentRout != AppRouts.cart ?
          () {
        Navigator.of(context).pushNamed(AppRouts.cart);
      } : null,
      child:
      BlocBuilder<CartViewModel, CartStates>(
        builder: (context, state) {
          final viewModel= CartViewModel.get(context);

          return Badge(
            alignment: AlignmentDirectional.topStart,
            backgroundColor: AppColors.greenColor,
            label: Text(viewModel.numOfCartItems.toString()),
            child: Icon(Icons.shopping_cart_rounded),
          );
        },
      ),
    );
  }
}
