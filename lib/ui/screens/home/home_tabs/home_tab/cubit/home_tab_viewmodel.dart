import 'package:ecommerce/ui/screens/home/home_tabs/home_tab/cubit/home_tab_states.dart';
import 'package:ecommerce/data/api/api_manager.dart';
import 'package:ecommerce/data/models/response/categories_brands_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabCubit extends Cubit<HomeTabStates> {
  HomeTabCubit() : super(HomeTabInitialState());

  //hold data , handle logic
  List<CategoryBrand>? categoriesList;
  List<CategoryBrand>? brandsList;

  void getAllCategories() async {
    try {
      emit(HomeTabLoadingState());
      var response = await ApiManager.getAllCategories();
      if (response.statusMsg == 'fail') {
        emit(HomeTabErrorState(errorMessage: response.message!));
      } else {
        categoriesList = response.data!;
        if (categoriesList != null) {
          emit(HomeTabSuccessState(categoreyResponse: response));
        }
      }
    } catch (e) {
      emit(HomeTabErrorState(errorMessage: e.toString()));
    }
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingState());
    try {
      var response = await ApiManager.getAllBrands();
      if (response.statusMsg == 'fail') {
        emit(HomeBrandsErrorState(errorMessage: response.message!));
      } else {
        brandsList = response.data!;
        if (brandsList != null) {
          emit(HomeBrandsSuccessState(categoreyResponse: response));
        }
      }
    } catch (e) {
      emit(HomeBrandsErrorState(errorMessage: e.toString()));
    }
  }
}
