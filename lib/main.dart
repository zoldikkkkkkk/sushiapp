import 'package:flutter/material.dart';
import 'package:my_first_projectonthismac/models/shop.dart';
import 'package:my_first_projectonthismac/pages/cartpage.dart';
import 'package:my_first_projectonthismac/pages/intro_page.dart';
import 'package:my_first_projectonthismac/pages/menu_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
