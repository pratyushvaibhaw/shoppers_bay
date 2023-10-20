import 'package:flutter/material.dart';
import 'package:shoppers_bay/utils/routes/routes_name.dart';
import 'package:shoppers_bay/view/login_view.dart';
import 'package:shoppers_bay/view/pages/home_navigator_page.dart';
import 'package:shoppers_bay/view/product_detail_view.dart';
import 'package:shoppers_bay/view/splash_view.dart';

class Routes {
  MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.productview:
        return MaterialPageRoute(builder: (context) => ProductDetailView(index: settings.arguments as int,));
      case RoutesName.splashview:
        return MaterialPageRoute(builder: (context) => SplashView());
      case RoutesName.loginview:
        return MaterialPageRoute(builder: (context) => LoginView());
      case RoutesName.homenavigator:
        return MaterialPageRoute(
            builder: (context) =>
                HomeNavigatorPage(username: settings.arguments as String));
      default:
        return MaterialPageRoute(
            builder: (context) =>
                Center(child: Text('OOPS_ERROR_LOADING_THE_PAGE')));
    }
  }
}
