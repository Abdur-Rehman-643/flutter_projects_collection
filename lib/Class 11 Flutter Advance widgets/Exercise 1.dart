import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise 1 Stacked Images'),
        ),
        body: const StackedImages(),
      ),
    );
  }
}

class StackedImages extends StatelessWidget {
  const StackedImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // First image
          Positioned(
            top: 50,
            left: 50,
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMTiTe9T0dwkXFOrTBQYSSAOG69fhitSryFQ&s',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          // Second image
          Positioned(
            top: 220,
            left: 220,
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyXVZ-UQ75558LuhUbyhyK2vm7Fjn90atyWQ&s',
              width: 130,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          // Third image
          Positioned(
            top: 50,
            left: 50,
            child: Image.network(
              'https://img.freepik.com/premium-photo/illustration-cute-boy-avatar-graphic-white-background-created-with-generative-ai-technology_67092-4578.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
