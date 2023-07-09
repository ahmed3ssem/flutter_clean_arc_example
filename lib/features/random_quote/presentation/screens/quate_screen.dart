import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_example/core/utils/app_strings.dart';

class QuateScreen extends StatelessWidget {
  const QuateScreen({Key? key}) : super(key: key);

  Widget _buildBodyContent(){
    return const Column();
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
