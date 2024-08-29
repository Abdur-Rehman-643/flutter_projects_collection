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
          title: const Text('ListView Exercise 1'),
        ),
        body: ContainerList(),
      ),
    );
  }
}

class ContainerList extends StatelessWidget {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.pink,
    Colors.teal,
    Colors.brown,
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.star,
    Icons.work,
    Icons.school,
    Icons.beach_access,
    Icons.flight,
    Icons.directions_car,
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_bus,
  ];

  final List<String> titles = [
    'Home',
    'Star',
    'Work',
    'School',
    'Beach',
    'Flight',
    'Car',
    'Bike',
    'Boat',
    'Bus',
  ];

  ContainerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          color: colors[index],
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            leading: Icon(icons[index], color: Colors.white),
            title: Text(
              titles[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
