import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/exceptions/app_exception.dart';
import 'package:e_commerce/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/utils/app_assets.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getCategoriesUseCase;
  GetAllBrandsUseCase getBrandsUseCase;
  HomeTabSuccessState successState = HomeTabSuccessState();
  HomeTabViewModel({
    required this.getCategoriesUseCase,
    required this.getBrandsUseCase,
  }) : super(HomeTabInitialState());
  List<String> imagesList = [
    AppAssets.announcement1,
    AppAssets.announcement2,
    AppAssets.announcement3,
  ];
  void getCategories() async {
    try {
      emit(BrandLoadingState());
      var categoriesList = await getCategoriesUseCase.invoke();
      emit(successState =successState.copyWith(categoriesList: categoriesList));
    } on AppException catch (e) {
      emit(BrandErrorState(message: e.message));
    }
  }
  void getBrands()async{
    emit(BrandLoadingState());
    try{
      var brandsList=await getBrandsUseCase.invoke();
      emit(successState= successState.copyWith(brandsList: brandsList));
    }on AppException catch(e){
      emit(BrandErrorState(message: e.message));
    }
  }
}
