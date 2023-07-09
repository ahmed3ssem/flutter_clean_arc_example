import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_example/config/routes/app_routes.dart';
import 'package:flutter_clean_arc_example/core/utils/app_colors.dart';
import 'package:flutter_clean_arc_example/core/utils/constants.dart';

class QuateScreen extends StatelessWidget {
  const QuateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: ()=>Constants.showErrorDialog(context: context, msg: 'Error '),
          child: Text("Hi" , style: TextStyle(color: AppColors.primary , fontSize: 16 , fontWeight: FontWeight.w500),),
        ),
      ),
    );
  }
}
