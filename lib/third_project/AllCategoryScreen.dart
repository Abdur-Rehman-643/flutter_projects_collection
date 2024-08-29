import 'package:first_mini_project/third_project/AccessoriesScreen.dart';
import 'package:first_mini_project/third_project/BottomsScreen.dart';
import 'package:first_mini_project/third_project/HeelsScreen.dart';
import 'package:first_mini_project/third_project/ShirtsScreen.dart';
import 'package:first_mini_project/third_project/ShoesScreen.dart';
import 'package:first_mini_project/third_project/TopsScreen.dart';
import 'package:flutter/material.dart';

class AllCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  leading: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.network(
                      category['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(category['title']!),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Widget screen = Container();
                    switch (category['title']) {
                      case 'Shirts':
                        screen = ShirtsScreen();
                        break;
                      case 'Bottoms':
                        screen = BottomsScreen();
                        break;
                      case 'Shoes':
                        screen = ShoesScreen();
                        break;
                      case 'Heels':
                        screen = HeelsScreen();
                        break;
                      case 'Accessories':
                        screen = AccessoriesScreen();
                        break;
                      case 'Tops':
                        screen = TopsScreen();
                        break;
                      default:
                      // Handle default case
                    }
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => screen),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  final List<Map<String, String>> categories = [
    {
      'title': 'Shirts',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaJF_xMHtne14FpDTmteAvk4C3A3D36HQ0KQ&s',
    },
    {
      'title': 'Bottoms',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgbeuY7_YzMIQqMvido3Ie4Wp0xEJfWARMucuZYj9QYePPq1L8SfF7Dnl7f-DWUKCCQ9c&usqp=CAU',
    },
    {
      'title': 'Shoes',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRESLOGNtL9Z56pg8lMOVCJEYoMC7LwVi0bt8C6iZ8igqfr4uNKrhuxSJcEy-Pkh_-q9Xw&usqp=CAU',
    },
    {
      'title': 'Heels',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE7E5K0-HT7T6EbvzHfLUGf5JA5uUrfa26nw&s',
    },
    {
      'title': 'Accessories',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3ZBo9nlM9IoUV33yOEY3o_yibM95UOLAHeg&s',
    },
    {
      'title': 'Tops',
      'image': 'https://cdn-icons-png.flaticon.com/512/88/88815.png',
    },
  ];
}
