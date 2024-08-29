import 'package:flutter/material.dart';

class BottomsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottoms'),
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
                image:
                    'assets/images/Ladies trouser design lown cotton stitch.jpg',
                description: 'Ladies trouser design lown cotton stitch',
                price: '\$29.99',
              ),
              ProductCard(
                image:
                    'assets/images/Women Light Blue High Waist Wide Leg Denim Jeans.jpg',
                description: 'High Waist Wide Leg Denim Jeans',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/Women White Cotton Basic Trouser.jpg',
                description: 'Women White Cotton Basic Trouser',
                price: '\$19.99',
              ),
              ProductCard(
                image:
                    'assets/images/Women Wide Leg High Waist Denim Jeans.jpg',
                description: 'Women Wide Leg High Waist Denim Jeans',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/Womens Dark Blue Bell Bottoms Jeans.jpg',
                description: 'Womens Dark Blue Bell Bottoms Jeans',
                price: '\$26.99',
              ),
              ProductCard(
                image:
                    'assets/images/Ladies trouser design lown cotton stitch.jpg',
                description: 'Ladies trouser design lown cotton stitch',
                price: '\$29.99',
              ),
              ProductCard(
                image:
                    'assets/images/Women Light Blue High Waist Wide Leg Denim Jeans.jpg',
                description: 'High Waist Wide Leg Denim Jeans',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/Women White Cotton Basic Trouser.jpg',
                description: 'Women White Cotton Basic Trouser',
                price: '\$19.99',
              ),
              ProductCard(
                image:
                    'assets/images/Women Wide Leg High Waist Denim Jeans.jpg',
                description: 'Women Wide Leg High Waist Denim Jeans',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/Womens Dark Blue Bell Bottoms Jeans.jpg',
                description: 'Womens Dark Blue Bell Bottoms Jeans',
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
