import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RowSectionWidget extends StatelessWidget {
  String name;

  RowSectionWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: MyColors.textColor,
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'View All',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: MyColors.textColor,
              ),
            )),
      ],
    );
  }
}
