import 'package:ecommerce/ui/screens/home/home_tabs/favorits_tab/cubit/WishList_viewmodel.dart';
import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:ecommerce/data/models/response/GetWishListResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteItem extends StatelessWidget {
  GetWishlistData wishList;

  FavouriteItem({required this.wishList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 24.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.w, color: MyColors.blueColor),
        ),
        width: 398.w,
        height: 145.h,
        child: Row(children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 145.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.network(
              wishList.imageCover ?? '',
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        wishList.title ?? '',
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: MyColors.blueColor,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            WishListCubit.get(context)
                                .deleteItemFromWishlist(wishList.id ?? '');
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: MyColors.blueColor,
                            size: 20.sp,
                          )),
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
                        'EGP ${wishList.price}',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: MyColors.blueColor,
                        ),
                      ),
                      Container(
                          height: 42.h,
                          width: 122.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: MyColors.blueColor,
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                          child: Text(
                            'Add to cart',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: MyColors.whiteColor,
                            ),
                          )),
                    ],
                  ),
                ))
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
