import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_example/features/random_quote/presentation/screens/quate_screen.dart';

class Quote extends StatelessWidget {
  const Quote({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const QuateScreen()
    );
  }
}