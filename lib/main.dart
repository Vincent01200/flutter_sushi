import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_flutter/models/shop.dart';
import 'package:sushi_flutter/page/cart_page.dart';

import 'package:sushi_flutter/page/login_page.dart';
import 'package:sushi_flutter/page/main_page.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        "/main": (context) => const MainPage(),
        "/cart": (context) => const CartPage(),
      },
    );
  }
}
