import 'package:flutter/material.dart';

class ShirtsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shirts'),
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
                image: 'assets/images/Half Sleeves White T-shirt For Men.jpg',
                description: 'Half Sleeves White T-shirt For Men',
                price: '\$29.99',
              ),
              ProductCard(
                image: 'assets/images/Majestic Man Cotton Solid.jpg',
                description: 'Majestic Men Cotton Solid',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/Men Cotton Shirt.jpg',
                description: 'Men Cotton Shirt',
                price: '\$19.99',
              ),
              ProductCard(
                image: 'assets/images/men Fashion casual shirts.jpg',
                description: 'Men Fashion casual shirts',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/Super Fine Cotton Formal Shirt.jpeg',
                description: 'Super Fine Cotton Formal Shirt',
                price: '\$26.99',
              ),
              ProductCard(
                image: 'assets/images/Half Sleeves White T-shirt For Men.jpg',
                description: 'Half Sleeves White T-shirt For Men',
                price: '\$29.99',
              ),
              ProductCard(
                image: 'assets/images/Majestic Man Cotton Solid.jpg',
                description: 'Majestic Men Cotton Solid',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/Men Cotton Shirt.jpg',
                description: 'Men Cotton Shirt',
                price: '\$19.99',
              ),
              ProductCard(
                image: 'assets/images/men Fashion casual shirts.jpg',
                description: 'Men Fashion casual shirts',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/Super Fine Cotton Formal Shirt.jpeg',
                description: 'Super Fine Cotton Formal Shirt',
                price: '\$26.99',
              )
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
