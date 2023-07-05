import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_example/core/utils/app_colors.dart';
import 'package:flutter_clean_arc_example/core/utils/app_strings.dart';
import 'package:flutter_clean_arc_example/features/random_quote/presentation/screens/quate_screen.dart';

class Quote extends StatelessWidget {
  const Quote({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        useMaterial3: true,
      ),
      home: const QuateScreen()
    );
  }
}