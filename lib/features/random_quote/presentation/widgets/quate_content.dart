import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_example/core/utils/app_colors.dart';
import 'package:flutter_clean_arc_example/features/random_quote/domain/entities/quate.dart';

class QuateContent extends StatelessWidget {
  final Quote quote;
  const QuateContent({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(22)
      ),
      child: Text(quote.body, textAlign: TextAlign.center , style: Theme.of(context).textTheme.bodyMedium,),
    );
  }
}
