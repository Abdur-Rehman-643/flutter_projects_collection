import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccessoriesScreen(),
    );
  }
}

class AccessoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessories'),
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
                image: 'assets/images/Bride Pearl Head Band.jpg',
                description: 'Bride Pearl Head Band',
                price: '\$29.99',
              ),
              ProductCard(
                image: 'assets/images/Flower Hair Clip.jpeg',
                description: 'Flower Hair Clip',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/Flowers Bridal Hair Jewelry.jpg',
                description: 'Flowers Bridal Hair Jewelry',
                price: '\$19.99',
              ),
              ProductCard(
                image: 'assets/images/Male Leather Bracelet Watch.jpg',
                description: 'Male Leather Bracelet Watch',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/Korean watch for girl.jpeg',
                description: 'Korean watch for girl',
                price: '\$26.99',
              ),
              ProductCard(
                image: 'assets/images/Bride Pearl Head Band.jpg',
                description: 'Bride Pearl Head Band',
                price: '\$29.99',
              ),
              ProductCard(
                image: 'assets/images/Flower Hair Clip.jpeg',
                description: 'Flower Hair Clip',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/Flowers Bridal Hair Jewelry.jpg',
                description: 'Flowers Bridal Hair Jewelry',
                price: '\$19.99',
              ),
              ProductCard(
                image: 'assets/images/Male Leather Bracelet Watch.jpg',
                description: 'Male Leather Bracelet Watch',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/Korean watch for girl.jpeg',
                description: 'Korean watch for girl',
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
