import 'package:ecommerce/ui/screens/home/home_tabs/products_tab/cubit/products_tab_viewmodel.dart';
import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:ecommerce/ui/screens/cart/cubit/cart_screen_viewmodel.dart';
import 'package:ecommerce/data/models/response/get_cart_response.dart';
import 'package:ecommerce/data/models/response/products_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  final GetProductCart productCart;

  CartItem({required this.productCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.w, color: MyColors.blueColor),
        ),
        height: 145.h,
        child: Row(children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 145.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.network(productCart.product?.imageCover ?? ''),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productCart.product?.title ?? '',
                          maxLines: 2,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: MyColors.blueColor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            CartScreenCubit.get(context).deleteItemInCart(
                                productCart.product?.id ?? "");
                          },
                          child: Icon(Icons.delete_outline,
                              color: MyColors.blueColor),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 14.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'EGP ${productCart.price}',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: MyColors.blueColor,
                            ),
                          ),
                          Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: MyColors.blueColor,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Row(children: [
                              IconButton(
                                onPressed: () {
                                  int count = productCart.count!.toInt();
                                  if (count > 1) {
                                    CartScreenCubit.get(context)
                                        .updateCountInCart(
                                      productCart.product?.id ?? '',
                                      count - 1,
                                    );
                                  }
                                },
                                icon: Icon(Icons.remove_circle_outline,
                                    color: MyColors.whiteColor),
                              ),
                              Text(
                                '${productCart.count}',
                                style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.whiteColor,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  int count = productCart.count!.toInt();
                                  CartScreenCubit.get(context)
                                      .updateCountInCart(
                                    productCart.product?.id ?? '',
                                    count + 1,
                                  );
                                },
                                icon: Icon(Icons.add_circle_outline,
                                    color: MyColors.whiteColor),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
