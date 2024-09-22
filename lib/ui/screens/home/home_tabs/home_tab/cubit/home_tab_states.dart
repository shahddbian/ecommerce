import 'package:ecommerce/data/models/response/categories_brands_response.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeTabLoadingState extends HomeTabStates {}

class HomeTabErrorState extends HomeTabStates {
  String errorMessage;

  HomeTabErrorState({required this.errorMessage});
}

class HomeTabSuccessState extends HomeTabStates {
  CategoreyBrandResponse categoreyResponse;

  HomeTabSuccessState({required this.categoreyResponse});
}

//////////////////////////////////
class HomeBrandsLoadingState extends HomeTabStates {}

class HomeBrandsErrorState extends HomeTabStates {
  String errorMessage;

  HomeBrandsErrorState({required this.errorMessage});
}

class HomeBrandsSuccessState extends HomeTabStates {
  CategoreyBrandResponse categoreyResponse;

  HomeBrandsSuccessState({required this.categoreyResponse});
}
