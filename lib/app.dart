import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/bloc/cart_bloc.dart';
import 'package:my_app/intro_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shopping Cart",
        home: IntroPage(),
      ),
    );
  }
}