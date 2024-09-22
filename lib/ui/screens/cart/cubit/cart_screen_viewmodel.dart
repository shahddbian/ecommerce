import 'package:ecommerce/ui/screens/cart/cubit/cart_screen_states.dart';
import 'package:ecommerce/data/api//api_manager.dart';
import 'package:ecommerce/data/models/response/get_cart_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenCubit extends Cubit<CartStates> {
  CartScreenCubit() : super(CartInitialState());

  List<GetProductCart> productsList = [];

  static CartScreenCubit get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(GetCartLoadingState());
    var either = await ApiManager.getCart();
    either.fold((l) {
      emit(GetCartErrorState(failures: l));
    }, (response) {
      productsList = response.data!.products!;
      emit(GetCartSuccessState(getCartResponse: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingState());
    var either = await ApiManager.deleteItemInCart(productId);
    either.fold((l) {
      emit(DeleteItemInCartErrorState(failures: l));
    }, (response) {
      getCart();
    });
  }

  void updateCountInCart(String productId, int count) async {
    emit(UpdateCountInCartLoadingState());
    var either = await ApiManager.updateCountInCart(productId, count);
    either.fold((l) {
      emit(UpdateCountInCartErrorState(failures: l));
    }, (response) {
      getCart();
    });
  }
}
