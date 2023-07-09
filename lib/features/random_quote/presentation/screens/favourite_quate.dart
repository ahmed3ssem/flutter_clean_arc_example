import 'package:flutter/material.dart';

class FavouriteQuateScreen extends StatefulWidget {
  const FavouriteQuateScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteQuateScreen> createState() => _FavouriteQuateScreenState();
}

class _FavouriteQuateScreenState extends State<FavouriteQuateScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hi Favourite'),
      ),
    );
  }
}
