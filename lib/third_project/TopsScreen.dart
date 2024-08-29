import 'package:flutter/material.dart';

class TopsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tops'),
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
                image: 'assets/images/short-sleeved T-shirt tops girls.jpg',
                description: 'short-sleeved T-shirt tops girls',
                price: '\$29.99',
              ),
              ProductCard(
                image: 'assets/images/Stitched High-Low Tops for Girls.jpg',
                description: 'Stitched High-Low Tops for Girls',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/Women summer Top.jpeg',
                description: 'Women summer Top',
                price: '\$19.99',
              ),
              ProductCard(
                image: 'assets/images/Women tops.jpg',
                description: 'Women tops',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/Womens Check  Casual Long Sleeve.jpg',
                description: 'Womens Check  Casual Long Sleeve',
                price: '\$26.99',
              ),
              ProductCard(
                image: 'assets/images/short-sleeved T-shirt tops girls.jpg',
                description: 'short-sleeved T-shirt tops girls',
                price: '\$29.99',
              ),
              ProductCard(
                image: 'assets/images/Stitched High-Low Tops for Girls.jpg',
                description: 'Stitched High-Low Tops for Girls',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/Women summer Top.jpeg',
                description: 'Women summer Top',
                price: '\$19.99',
              ),
              ProductCard(
                image: 'assets/images/Women tops.jpg',
                description: 'Women tops',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/Womens Check  Casual Long Sleeve.jpg',
                description: 'Womens Check  Casual Long Sleeve',
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
