import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:ecommerce/ui/screens/cart/cartitem.dart';
import 'package:ecommerce/ui/screens/cart/cubit/cart_screen_viewmodel.dart';
import 'package:ecommerce/ui/screens/cart/cubit/cart_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cartscreen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenCubit, CartStates>(
      bloc: CartScreenCubit.get(context)..getCart(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: MyColors.blueColor,
              ),
            ),
            title: Text(
              'Cart',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: MyColors.blueColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: MyColors.blueColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: MyColors.blueColor,
                ),
              ),
            ],
          ),
          body: state is GetCartSuccessState
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return CartItem(
                            productCart:
                                state.getCartResponse.data!.products![index],
                          );
                        },
                        itemCount: state.getCartResponse.data!.products!.length,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h, left: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price',
                                style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'EGP ${state.getCartResponse.data!.totalCartPrice}',
                                style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.blueColor,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // هنا يمكنك إضافة منطق لـ Checkout
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: MyColors.whiteColor,
                            ),
                            child: Container(
                              height: 48.h,
                              width: 270.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: MyColors.blueColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Checkout',
                                    style: TextStyle(
                                      color: MyColors.whiteColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: MyColors.whiteColor,
                                    size: 18.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: MyColors.blueColor,
                  ),
                ),
        );
      },
    );
  }
}
