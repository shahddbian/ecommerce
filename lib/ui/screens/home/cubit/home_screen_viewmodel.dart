import 'package:ecommerce/ui/screens/home/home_tabs/favorits_tab/favorits_screen.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/home_tab/home_tab.dart';
import 'package:ecommerce/ui/screens/home/cubit/home_screen_states.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/products_tab/productList.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());
  TextEditingController searchController = TextEditingController();

  int selectedIndex = 0;
  final List<Widget> tabs = [
    HomePageWidget(),
    ProductList(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  void changeSelectedIndex(int newIndex) {
    emit(HomeScreenInitialState());
    selectedIndex = newIndex;
    emit(ChangeSelectedIndexState());
  }
}
