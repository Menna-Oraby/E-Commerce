import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/exceptions/app_exception.dart';
import 'package:e_commerce/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetAllProductsUseCase getProductUseCase;
  HomeTabSuccessState successState = HomeTabSuccessState();
  ProductTabViewModel({required this.getProductUseCase})
    : super(ProductLoadingState());

  void getProducts() async {
    try {
      emit(ProductLoadingState());
      var productsList = await getProductUseCase.invoke();
      emit(ProductSuccessState(productsList: productsList));
    } on AppException catch (e) {
      emit(ProductErrorState(message: e.message));
    }
  }
}
