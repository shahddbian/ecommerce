import 'package:ecommerce/ui/screens/cart/cartscreen.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/products_tab/cubit/products_tab_states.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/products_tab/product_card.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/products_tab/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/products_tab/cubit/products_tab_viewmodel.dart';

class ProductList extends StatelessWidget {
  static const String routeName = 'product_list';
  ProductCubit cubit = ProductCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getAllProducts(),
      child: BlocBuilder<ProductCubit, ProductStates>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: MyColors.whiteColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Image.asset('assets/images/app_bar_logo.png'),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: MyColors.blueColor),
                          decoration: InputDecoration(
                            labelText: 'What do you search for?',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 18,
                              color: MyColors.textColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: MyColors.blueColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: MyColors.blueColor),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: MyColors.blueColor,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                        child: Badge(
                          label: Text(cubit.numOfCartItem.toString()),
                          child: Icon(
                            Icons.shopping_cart,
                            size: 28.sp,
                            color: MyColors.blueColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                state is ProductSuccessState || state is AddCartSuccessState
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 2.4,
                              crossAxisSpacing: 16.w,
                              mainAxisSpacing: 16.h,
                            ),
                            itemCount: cubit.productList?.length ?? 0,
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    ProductDetailsScreen.routeName,
                                    arguments: cubit.productList![index],
                                  );
                                },
                                child: ProductCard(
                                  product: cubit.productList![index],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: MyColors.blueColor,
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
