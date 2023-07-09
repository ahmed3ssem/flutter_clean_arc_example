import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants{

  static void showErrorDialog({required BuildContext context ,required String msg}){
    showDialog(context: context, builder: (context)=>
    CupertinoAlertDialog(
      title: Text(msg , style: const TextStyle(color: Colors.red , fontSize: 16),),
      actions: [
        TextButton(onPressed: ()=>Navigator.pop(context), child: const Text('OK' , style: TextStyle(fontSize: 14 , color: Colors.black),))
      ],
    )
    );
  }
}