import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:e_commerce/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce/features/ui/widgets/cart_item.dart';
import 'package:e_commerce/features/ui/widgets/main_error_widget.dart';
import 'package:e_commerce/features/ui/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../widgets/custom_app_bar_badge.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartViewModel.get(context).getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocListener<CartViewModel, CartStates>(
  listener: (context, state) {
    if(state is GetCartSuccessState){
      DialogUtils.showSnackBar(context: context, message:state.message??'success');
    }
  },
  child: BlocBuilder<CartViewModel, CartStates>(
        builder: (context, state) {
          if(state is GetCartErrorState){
            return MainErrorWidget(messageError: state.message);
          }else if(state is GetCartSuccessState){
          return Column(
            children: [
              Expanded(child: ListView.builder(
                  itemCount: state.getCart.products!.length,
                  itemBuilder: (context, index) {
                    return CartItem(item: state.getCart.products![index]);
                  })
              ),
              _buildCheckOut(state.getCart.totalCartPrice!.toDouble())
            ],
          );}
          else{
            return MainLoadingWidget();
          }
        },
      ),
),
    );
  }


  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,

      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.primaryColor,
        ),
      ),

      title: Text(
        'Cart',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: AppColors.primaryColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ),

      actions: [
        IconButton(
          onPressed: () {
            // Search
          },
          icon: Icon(
            Icons.search,
            color: AppColors.primaryColor,
            size: 28.sp,
          ),
        ),

        CustomAppBarBadge(),
      ],
    );
  }

  Widget _buildCheckOut(double totalPrice) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Total Price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total price',
                  style: TextStyle(
                    fontSize: 16,
                    color:AppColors.primaryDarkLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                 Text(
                  'EGP $totalPrice',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Check Out Button
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  AppColors.primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Check Out',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
