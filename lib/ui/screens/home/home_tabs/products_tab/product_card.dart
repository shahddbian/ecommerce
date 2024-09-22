import 'package:ecommerce/ui/screens/home/home_tabs/favorits_tab/cubit/WishList_viewmodel.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/products_tab/cubit/products_tab_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:ecommerce/data/models/response/products_response.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isWishlisted = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Column(children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.network(
                widget.product.imageCover ?? '',
                height: 128.h,
                width: 191.w,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 5.h,
              right: 2.w,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                child: IconButton(
                  color: MyColors.blueColor,
                  padding: EdgeInsets.zero,
                  icon: isWishlisted
                      ? const Icon(Icons.favorite_rounded)
                      : const Icon(Icons.favorite_border_rounded),
                  onPressed: () {
                    setState(() {
                      isWishlisted = !isWishlisted;
                    });
                    WishListCubit.get(context)
                        .addToWishlist(widget.product.id ?? '');
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 7.h),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            widget.product.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: MyColors.blueColor,
            ),
          ),
        ),
        SizedBox(height: 7.h),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Row(
            children: [
              Text(
                'EGP ${widget.product.price}',
                maxLines: 1,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.blueColor,
                ),
              ),
              SizedBox(width: 10.w),
            ],
          ),
        ),
        SizedBox(height: 7.h),
        Padding(
          padding: EdgeInsets.only(left: 8.w, right: 8.w),
          child: Row(
            children: [
              Text(
                'Reviews ${widget.product.ratingsAverage} ',
                maxLines: 1,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.blueColor,
                ),
              ),
              SizedBox(width: 10.w),
              Icon(Icons.star, color: Colors.yellow, size: 16),
              const Spacer(flex: 1),
              InkWell(
                onTap: () {
                  ProductCubit.get(context).addToCart(widget.product.id ?? '');
                },
                splashColor: Colors.transparent,
                child: Icon(
                  Icons.add_circle,
                  size: 32.sp,
                  color: MyColors.blueColor,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
