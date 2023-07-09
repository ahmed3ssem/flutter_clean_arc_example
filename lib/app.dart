import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_example/config/routes/app_routes.dart';
import 'package:flutter_clean_arc_example/config/thems/app_theme.dart';
import 'package:flutter_clean_arc_example/core/utils/app_strings.dart';

class Quote extends StatelessWidget {
  const Quote({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}