import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arc_example/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:flutter_clean_arc_example/features/random_quote/presentation/screens/quate_screen.dart';
import 'package:flutter_clean_arc_example/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter_clean_arc_example/injection_container.dart' as di;

class Routes{

  static const String intialRoutes = '/';
  static const String randomQuoteRoutes = '/randomQuote';
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
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => di.sl<RandomQuoteCubit>(),
            child: const SplashScreen(),
          ),
        );
      case Routes.randomQuoteRoutes:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<RandomQuoteCubit>(),
            child: const QuateScreen(),
          ),
        );
      case Routes.favouriteRoutes:
        //return MaterialPageRoute(builder: ((context) => const FavouriteQuateScreen()));
      default:
        return null;
    }
  }
}