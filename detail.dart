import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  Offset _offset = Offset.zero;
  Offset _startFocalPoint = Offset.zero;
  Offset _previousOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final carName = args?['name'] ?? 'Unknown Car';
    final carImage = args?['image'] ?? 'assets/default_car.jpeg';
    final carPrice = args?['price'] ?? 'Price not available';

    return Scaffold(
      appBar: AppBar(
        title: Text('$carName Details'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gesture Detection for Pinch-to-Zoom and Pan functionality
              GestureDetector(
                onScaleStart: (details) {
                  _previousScale = _scale;
                  _startFocalPoint = details.focalPoint;
                  _previousOffset = _offset;
                },
                onScaleUpdate: (details) {
                  setState(() {
                    _scale = (_previousScale * details.scale).clamp(1.0, 4.0); // Limit scale between 1x and 4x
                    final Offset delta = details.focalPoint - _startFocalPoint;
                    _offset = _previousOffset + delta / _scale;
                  });
                },
                onScaleEnd: (details) {
                  _previousScale = 1.0;
                },
                child: Center(
                  child: Transform.translate(
                    offset: _offset,
                    child: Transform.scale(
                      scale: _scale,
                      child: Hero(
                        tag: carName,
                        child: Image.asset(
                          carImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Car details
              Text(
                carName,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Price: $carPrice',
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
              ),
              SizedBox(height: 16.0),

              // Car description
              Text(
                'Experience the luxury and performance of the $carName. This model features cutting-edge technology, '
                    'a spacious interior, and top-notch safety features. Perfect for those who appreciate quality and elegance.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),

              // Purchase button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/purchase', arguments: args);
                },
                icon: Icon(Icons.shopping_cart),
                label: Text('Purchase Now'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
