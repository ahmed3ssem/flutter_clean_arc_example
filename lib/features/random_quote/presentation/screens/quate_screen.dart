import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_example/core/utils/app_colors.dart';
import 'package:flutter_clean_arc_example/core/utils/app_strings.dart';
import 'package:flutter_clean_arc_example/features/random_quote/presentation/widgets/quate_content.dart';

class QuateScreen extends StatelessWidget {
  const QuateScreen({Key? key}) : super(key: key);

  Widget _buildBodyContent(){
    return Column(
      children: [
        const QuateContent(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary
          ),
          child: const Icon(Icons.refresh , size: 28 , color: Colors.white,),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appBarName),
      ),
      body: _buildBodyContent(),
    );
  }
}
