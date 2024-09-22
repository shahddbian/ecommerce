import 'package:ecommerce/data/models/response/get_cart_response.dart';
import 'package:ecommerce/data/models/faliuer.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartErrorState extends CartStates {
  Failures failures;

  GetCartErrorState({required this.failures});
}

class GetCartSuccessState extends CartStates {
  GetCartResponse getCartResponse;

  GetCartSuccessState({required this.getCartResponse});
}
//////////////////////////////////

class DeleteItemInCartLoadingState extends CartStates {}

class DeleteItemInCartErrorState extends CartStates {
  Failures failures;

  DeleteItemInCartErrorState({required this.failures});
}

class DeleteItemInCartSuccessState extends CartStates {
  GetCartResponse getCartResponse;

  DeleteItemInCartSuccessState({required this.getCartResponse});
}

///////////////////////////////
class UpdateCountInCartLoadingState extends CartStates {}

class UpdateCountInCartErrorState extends CartStates {
  Failures failures;

  UpdateCountInCartErrorState({required this.failures});
}

class UpdateCountInCartSuccessState extends CartStates {
  GetCartResponse getCartResponse;

  UpdateCountInCartSuccessState({required this.getCartResponse});
}
