import 'package:e_commerce/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'package:e_commerce/features/ui/widgets/favorite_item.dart';
import 'package:e_commerce/features/ui/widgets/main_error_widget.dart';
import 'package:e_commerce/features/ui/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}


class _FavoriteTabState extends State<FavoriteTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FavoriteTabViewModel.get(context).getWishList();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteTabViewModel, FavoriteTabStates>(
      builder: (context, state) {
        if(state is GetFavoriteTabErrorState){
          return MainErrorWidget(messageError: state.message);
        } else if (state is GetFavoriteTabSuccessState){
        return Column(children: [
          Expanded(child: ListView.builder(
              itemCount: state.getWishlist.length,
              itemBuilder: (context, index) {
                return FavoriteItem(wishlist: state.getWishlist[index]);
              }))
        ],);
      }else{
          return MainLoadingWidget();
        }
      }
    );
  }
}
