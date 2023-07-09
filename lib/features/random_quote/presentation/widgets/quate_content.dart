import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_example/core/utils/app_colors.dart';

class QuateContent extends StatelessWidget {
  const QuateContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(22)
      ),
      child: Text('Hello , This is an app to build an example of clean arch using flutter framework', textAlign: TextAlign.center , style: Theme.of(context).textTheme.bodyMedium,),
    );
  }
}
