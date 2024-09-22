import 'package:ecommerce/ui/screens/home/home_tabs/home_tab/widgtes/category_brand_item.dart';
import 'package:ecommerce/data/models/response/categories_brands_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesBrandsWidget extends StatelessWidget {
  List<CategoryBrand> list;

  CategoriesBrandsWidget({required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.h,
        child: GridView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
          itemBuilder: (context, index) {
            return CategoryBrandItem(
              categoryOrBrand: list[index],
            );
          },
        ));
  }
}
