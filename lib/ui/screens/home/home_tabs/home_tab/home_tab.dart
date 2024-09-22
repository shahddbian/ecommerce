import 'package:ecommerce/ui/screens/home/home_tabs/home_tab/cubit/home_tab_states.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/home_tab/cubit/home_tab_viewmodel.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/home_tab/widgtes/categories_brands_widgets.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/home_tab/widgtes/row_section_widget.dart';
import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/home_tab/widgtes/ads_section.dart';
import 'package:ecommerce/data/api/api_manager.dart';
import 'package:ecommerce/data/models/response/categories_brands_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatelessWidget {
  static const String routeName = 'homepage';
  HomeTabCubit cubit = HomeTabCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabStates>(
        bloc: cubit
          ..getAllCategories()
          ..getAllBrands(),
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 17.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Positioned(
                      left: 20,
                      child: Image.asset('assets/images/app_bar_logo.png'),
                    ),
                    SizedBox(height: 20),
                    //search
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: MyColors.blueColor),
                            decoration: InputDecoration(
                              labelText: 'what do you search for?',
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 18,
                                color: MyColors.textColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(color: MyColors.blueColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(color: MyColors.blueColor)),
                              prefixIcon: Icon(
                                Icons.search,
                                color: MyColors.blueColor,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.shopping_cart,
                          color: MyColors.blueColor,
                          size: 30,
                        ),
                      ],
                    ),
                    //////////////////////////////////////////////////////
                    SizedBox(height: 16.h),
                    AdsSection(),
                    SizedBox(height: 16.h),
                    //////////////////////////////////////////////////////
                    RowSectionWidget(name: 'Categories'),
                    SizedBox(height: 24.h),

                    state is HomeTabLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: MyColors.blueColor,
                            ),
                          )
                        : state is HomeTabErrorState
                            ? Center(
                                child: Text(
                                    textWidthBasis: TextWidthBasis.longestLine,
                                    state.errorMessage,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: MyColors.blueColor,
                                    )))
                            : CategoriesBrandsWidget(
                                list: cubit.categoriesList!),

                    SizedBox(height: 24.h),
                    RowSectionWidget(name: 'Brands'),
                    SizedBox(height: 24.h),

                    state is HomeBrandsLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: MyColors.blueColor,
                            ),
                          )
                        : state is HomeBrandsErrorState
                            ? Center(
                                child: Text(
                                    textWidthBasis: TextWidthBasis.longestLine,
                                    state.errorMessage,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: MyColors.blueColor,
                                    )))
                            : state is HomeBrandsSuccessState
                                ? CategoriesBrandsWidget(
                                    list: cubit.brandsList!)
                                : const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          );
        });
  }
}
