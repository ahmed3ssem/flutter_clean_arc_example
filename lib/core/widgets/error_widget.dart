import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_example/core/utils/app_colors.dart';
import 'package:flutter_clean_arc_example/core/utils/media_query_values.dart';

class ErrorrWidget extends StatelessWidget {
  final VoidCallback onTap;
  const ErrorrWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(Icons.warning_amber_rounded , size: 150, color: AppColors.primary,),
        ),
        Container(
          margin:const EdgeInsets.symmetric(vertical: 12),
          child:const Text('Something Went Wrong' , style: TextStyle(color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 20),),
        ),
        Text('Please try Again' , style:  TextStyle(color: AppColors.hint , fontSize: 18 , fontWeight: FontWeight.w500),),
        Container(
          width: context.width*0.55,
          height: 55,
          margin:const EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Theme.of(context).primaryColor,
              elevation: 500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
              )
            ),
            onPressed: onTap,
            child:const Text('Reload Screen' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 20),),
          ),
        )
      ],
    );
  }
}
