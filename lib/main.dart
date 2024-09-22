import 'package:ecommerce/ui/screens/auth/login/loginscreen.dart';
import 'package:ecommerce/ui/screens/cart/cubit/cart_screen_viewmodel.dart';
import 'package:ecommerce/ui/screens/home/home_tabs/favorits_tab/cubit/WishList_viewmodel.dart';
import 'package:ecommerce/ui/screens/home/homescreen.dart';
import 'package:ecommerce/ui/utils/blocobserver.dart';
import 'package:ecommerce/ui/utils/my_theme.dart';
import 'package:ecommerce/ui/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/ui/utils/sharedpreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await mySharedPreferences.init();
  var token = mySharedPreferences.getData(key: 'token');
  String route;
  if (token == null) {
    route = LoginScreen.routeName;
  } else {
    route = HomeScreen.routeName;
  }

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => CartScreenCubit()),
      BlocProvider(
        create: (context) => WishListCubit(),
      )
    ],
    child: MyApp(route: route),
  ));
}

class MyApp extends StatelessWidget {
  String route;

  MyApp({required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: MyTheme.myTheme,
            initialRoute: LoginScreen.routeName,
            routes: MyRoutes.myRoutes,
          );
        });
  }
}
