import 'package:flutter/material.dart';

class ShoesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoes'),
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
                image: 'assets/images/GILS HIGH HEEL SHOES.jpeg',
                description: 'GILS HIGH HEEL SHOES',
                price: '\$29.99',
              ),
              ProductCard(
                image: 'assets/images/Jaf Spot Womens Thick Sole Sneakers.jpg',
                description: 'Jaf Spot Womens Thick Sole Sneakers',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/Mens Sneakers.jpg',
                description: 'Mens Sneakers',
                price: '\$19.99',
              ),
              ProductCard(
                image: 'assets/images/Men casual shoes.jpg',
                description: 'Men casual shoes',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/White sneakers for mens and womens.jpg',
                description: 'White sneakers for mens and womens',
                price: '\$26.99',
              ),
              ProductCard(
                image: 'assets/images/GILS HIGH HEEL SHOES.jpeg',
                description: 'GILS HIGH HEEL SHOES',
                price: '\$29.99',
              ),
              ProductCard(
                image: 'assets/images/Jaf Spot Womens Thick Sole Sneakers.jpg',
                description: 'Jaf Spot Womens Thick Sole Sneakers',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/Mens Sneakers.jpg',
                description: 'Mens Sneakers',
                price: '\$19.99',
              ),
              ProductCard(
                image: 'assets/images/Men casual shoes.jpg',
                description: 'Men casual shoes',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/White sneakers for mens and womens.jpg',
                description: 'White sneakers for mens and womens',
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
