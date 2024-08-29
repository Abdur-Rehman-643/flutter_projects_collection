import 'package:flutter/material.dart';

class HeelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heels'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            children: [
              ProductCard(
                image: 'assets/images/Ladies High Heel Sandals.jpg',
                description: 'Ladies High Heel Sandals',
                price: '\$29.99',
              ),
              ProductCard(
                image: 'assets/images/Toe High Heels.jpeg',
                description: 'Toe High Heels',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/Womens High Heels.jpg',
                description: 'Womens High Heels',
                price: '\$19.99',
              ),
              ProductCard(
                image: 'assets/images/women fashion sandal.jpeg',
                description: 'women fashion sandal',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/Women Fashion Block High Heels.jpg',
                description: 'Women Fashion Block High Heels',
                price: '\$26.99',
              ),
              ProductCard(
                image: 'assets/images/Ladies High Heel Sandals.jpg',
                description: 'Ladies High Heel Sandals',
                price: '\$29.99',
              ),
              ProductCard(
                image: 'assets/images/Toe High Heels.jpeg',
                description: 'Toe High Heels',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/Womens High Heels.jpg',
                description: 'Womens High Heels',
                price: '\$19.99',
              ),
              ProductCard(
                image: 'assets/images/women fashion sandal.jpeg',
                description: 'women fashion sandal',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/Women Fashion Block High Heels.jpg',
                description: 'Women Fashion Block High Heels',
                price: '\$26.99',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String description;
  final String price;

  const ProductCard({
    required this.image,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            price,
            style: TextStyle(color: Color(0xFF626BFC), fontSize: 16),
          ),
        ],
      ),
    );
  }
}
