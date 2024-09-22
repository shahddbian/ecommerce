import 'package:ecommerce/ui/screens/home/home_tabs/products_tab/cubit/products_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/data/models/response/products_response.dart';
import '../../../../../../data/api/api_manager.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());

  List<Product>? productList;
  int numOfCartItem = 0;

  void getAllProducts() async {
    emit(ProductLoadingState());
    try {
      var response = await ApiManager.getAllProducts();
      if (response.statusMsg == 'fail') {
        emit(ProductErrorState(errorMessage: response.message!));
      } else {
        productList = response.data ?? [];
        emit(ProductSuccessState(productResponse: response));
      }
    } catch (e) {
      emit(ProductErrorState(errorMessage: e.toString()));
    }
  }

  static ProductCubit get(context) => BlocProvider.of(context);

  void addToCart(String productId) async {
    emit(AddCartLoadingState());
    var either = await ApiManager.addToCart(productId);
    either.fold(
      (error) => emit(AddCartErrorState(failures: error)),
      (response) {
        numOfCartItem = response.numOfCartItems!.toInt();
        emit(AddCartSuccessState(productResponse: response));
      },
    );
  }
}
