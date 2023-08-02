import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_example/config/routes/app_routes.dart';
import 'package:flutter_clean_arc_example/core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Timer _timer;

  goNext() =>Navigator.pushReplacementNamed(context, Routes.randomQuoteRoutes);

  startTimer(){
     _timer = Timer(const Duration(seconds: 5), ()=> goNext());
   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImageAsset.ministry),
      ),
    );
  }
}
