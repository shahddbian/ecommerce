import 'package:ecommerce/ui/screens/home/home_tabs/favorits_tab/cubit/WishList_viewmodel.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/favorits_tab/cubit/WishListStates.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/favorits_tab/favorits_item.dart';
import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatelessWidget {
  static const String routeName = 'favourite_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListStates>(
      bloc: WishListCubit()..getWishlistItems(),
      builder: (context, state) {
        return Scaffold(
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
                  ],
                ),
              ),
              SizedBox(height: 20),
              state is WishListSuccuessState
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: state.response.data!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return FavouriteItem(
                            wishList: state.response.data![index],
                          );
                        },
                      ),
                    )
                  : Center(
                      child: state is WishlistLoadingState
                          ? CircularProgressIndicator(
                              color: MyColors.blueColor,
                            )
                          : Text(
                              'Failed to load wishlist',
                              style: TextStyle(color: MyColors.blueColor),
                            ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
