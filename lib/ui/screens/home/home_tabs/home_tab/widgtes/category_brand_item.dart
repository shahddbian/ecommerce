import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:ecommerce/data/models/response/categories_brands_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryBrandItem extends StatelessWidget {
  //todo : category or brand model
  CategoryBrand categoryOrBrand;

  CategoryBrandItem({required this.categoryOrBrand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundImage: NetworkImage(categoryOrBrand.image ?? ''),
            radius: 50.r,
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
            flex: 2,
            child: Text(
              categoryOrBrand.name ?? '',
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: MyColors.textColor,
              ),
            ))
      ],
    );
  }
}
