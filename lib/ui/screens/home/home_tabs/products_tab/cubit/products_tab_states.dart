import 'package:ecommerce/data/models/response/add_to_cart_response.dart';
import 'package:ecommerce/data/models/response/products_response.dart';
import '../../../../../../data/models/faliuer.dart';

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductErrorState extends ProductStates {
  final String errorMessage;

  ProductErrorState({required this.errorMessage});
}

class ProductSuccessState extends ProductStates {
  final ProductResponse productResponse;

  ProductSuccessState({required this.productResponse});
}

class AddCartLoadingState extends ProductStates {}

class AddCartErrorState extends ProductStates {
  final Failures failures;

  AddCartErrorState({required this.failures});
}

class AddCartSuccessState extends ProductStates {
  final AddCartResponse productResponse;

  AddCartSuccessState({required this.productResponse});
}
