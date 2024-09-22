import 'package:ecommerce/ui/screens/auth/login/loginscreen.dart';
import 'package:ecommerce/ui/screens/auth/register/register_screen.dart';
import 'package:ecommerce/ui/screens/cart/cartscreen.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/products_tab/productList.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/profile_tab/profile_tab.dart';
import 'package:ecommerce/ui/screens/home/homescreen.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/products_tab/product_details_screen.dart';
import '../screens/home/home_tabs/favorits_tab/favorits_screen.dart';

class MyRoutes {
  static var myRoutes = {
    HomeScreen.routeName: (context) => HomeScreen(),
    RegisterScreen.routeName: (context) => RegisterScreen(),
    LoginScreen.routeName: (context) => LoginScreen(),
    ProductList.routeName: (context) => ProductList(),
    ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
    ProfileScreen.routeName: (context) => ProfileScreen(),
    FavouriteScreen.routeName: (context) => FavouriteScreen(),
    CartScreen.routeName: (context) => CartScreen(),
  };
}
