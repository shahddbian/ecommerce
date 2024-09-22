import 'package:ecommerce/data/models/response/AddToWishListResponse.dart';
import 'package:ecommerce/data/models/response/GetWishListResponse.dart';
import 'package:ecommerce/data/models/faliuer.dart';

abstract class WishListStates {}

class WishListInitialState extends WishListStates {}

class WishlistLoadingState extends WishListStates {}

class WishlistErrorState extends WishListStates {
  Failures failures;

  WishlistErrorState({required this.failures});
}

class WishListSuccuessState extends WishListStates {
  GetWishlistResponse response;

  WishListSuccuessState({required this.response});
}

class AddWishlistLoadingState extends WishListStates {}

class AddToWishlistErrorState extends WishListStates {
  Failures failures;

  AddToWishlistErrorState({required this.failures});
}

class AddToWishlistSuccuessState extends WishListStates {
  AddToWishlistResponse response;

  AddToWishlistSuccuessState({required this.response});
}

class DeleteFromWishlistLoadingState extends WishListStates {}

class DeleteFromWishlistErrorState extends WishListStates {
  Failures failures;

  DeleteFromWishlistErrorState({required this.failures});
}

class DeleteFromWishlistSuccuessState extends WishListStates {
  GetWishlistResponse response;

  DeleteFromWishlistSuccuessState({required this.response});
}
