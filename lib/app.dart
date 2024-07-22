import 'package:flutter/material.dart';
import 'package:my_app/intro_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shopping Cart",
      home: IntroPage(),
    );
  }
}