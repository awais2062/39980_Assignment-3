import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Accessories'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text('Accessories will be displayed here.', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
