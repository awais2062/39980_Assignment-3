import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Sample data for cars
  final List<Map<String, String>> carList = [
    {'name': 'Tesla', 'image': 'assets/tesla.jpeg', 'price': '50,000 USD'},
    {'name': 'BMW', 'image': 'assets/bmw.jpeg', 'price': '45,000 USD'},
    {'name': 'Audi', 'image': 'assets/audi.jpeg', 'price': '40,000 USD'},
    {'name': 'Mercedes', 'image': 'assets/mercedes.jpeg', 'price': '55,000 USD'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Showroom'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add notification functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Weather Section
              _buildWeatherSection(),
              SizedBox(height: 16.0),

              // Car images in a horizontal scrollable row with Hero animations
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: carList.map((car) {
                    return _buildCarCard(car, context);
                  }).toList(),
                ),
              ),
              SizedBox(height: 16.0),

              // Tags Section
              _buildTagsSection(),
              SizedBox(height: 16.0),

              // Welcome Text
              Text(
                'Welcome to My Car Showroom!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Browse through our exclusive collection of premium cars. Find your dream car today!',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              SizedBox(height: 16.0),

              // Footer Images Layout
              _buildFooterImages(),
            ],
          ),
        ),
      ),
    );
  }

  // Weather Section
  Widget _buildWeatherSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.wb_sunny, color: Colors.orange, size: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('22°C', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              Text('Sunny', style: TextStyle(fontSize: 18.0)),
            ],
          ),
          Icon(Icons.location_on, color: Colors.blue, size: 30),
        ],
      ),
    );
  }

  // Tags Section
  Widget _buildTagsSection() {
    return Row(
      children: [
        _buildTag('New'),
        _buildTag('Featured'),
        _buildTag('Exclusive'),
      ],
    );
  }

  Widget _buildTag(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.green.shade200,
      ),
    );
  }

  // Footer Images
  Widget _buildFooterImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/logo.jpeg', width: 100, height: 60, fit: BoxFit.cover),
        Image.asset('assets/logoo.jpeg', width: 100, height: 60, fit: BoxFit.cover),
        Image.asset('assets/logooo.jpeg', width: 100, height: 60, fit: BoxFit.cover),
      ],
    );
  }

  // Car Card with Hero Animation and Gesture Detection
  Widget _buildCarCard(Map<String, String> car, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: car,
        );
      },
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.only(right: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            Hero(
              tag: car['name']!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  car['image']!,
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(car['name']!, style: TextStyle(fontSize: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}
