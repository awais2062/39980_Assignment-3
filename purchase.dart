import 'package:flutter/material.dart';

class PurchaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final carName = args?['name'] ?? 'Unknown Car';
    final carPrice = args?['price'] ?? 'Price not available';
    final carImage = args?['image'] ?? 'assets/default_car.jpeg';

    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase $carName'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(carImage, width: double.infinity, height: 250, fit: BoxFit.cover),
            SizedBox(height: 16.0),
            Text('Car Name: $carName', style: TextStyle(fontSize: 24.0)),
            Text('Price: $carPrice', style: TextStyle(fontSize: 20.0, color: Colors.blue)),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your details',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add actual purchase logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Thank you for your purchase!')),
                );
              },
              child: Text('Confirm Purchase'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
