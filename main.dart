import 'package:flutter/material.dart';
import 'home.dart';
import 'detail.dart';
import 'purchase.dart';
import 'product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailScreen(),
        '/purchase': (context) => PurchaseScreen(),
        '/product': (context) => ProductScreen(),
      },
    );
  }
}
