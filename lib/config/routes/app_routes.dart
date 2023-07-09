import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_example/features/random_quote/presentation/screens/quate_screen.dart';

class Routes{

  static const String intialRoutes = '/';
  static const String favouriteRoutes = 'favouriteQuate';

}
/*

//Named Routes
final routes = {
  Routes.intialRoutes: (context)=>const QuateScreen(),
  Routes.favouriteRoutes: (context)=>const FavouriteQuateScreen(),
};*/

class AppRoutes{

  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routes.intialRoutes:
        return MaterialPageRoute(builder: ((context) => const QuateScreen()));
      case Routes.favouriteRoutes:
        //return MaterialPageRoute(builder: ((context) => const FavouriteQuateScreen()));
      default:
        return null;
    }
  }
}