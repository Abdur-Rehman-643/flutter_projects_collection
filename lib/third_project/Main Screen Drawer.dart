import 'package:first_mini_project/third_project/AccessoriesScreen.dart';
import 'package:first_mini_project/third_project/AllCategoryScreen.dart';
import 'package:first_mini_project/third_project/BottomsScreen.dart';
import 'package:first_mini_project/third_project/HeelsScreen.dart';
import 'package:first_mini_project/third_project/ShirtsScreen.dart';
import 'package:first_mini_project/third_project/ShoesScreen.dart';
import 'package:first_mini_project/third_project/TopsScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final String email;

  HomeScreen({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      drawer: CustomMainScreenDrawer(name: name, email: email),
      body: Center(
        child: Text('Home Screen Content'),
      ),
    );
  }
}

class CustomMainScreenDrawer extends StatelessWidget {
  final String name;
  final String email;

  CustomMainScreenDrawer({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: ClipOval(
                    child: SizedBox(
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSOuh7iOVm6IpoGAum0wbc0BEtYbtz5SO_Uw&s",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 42),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Username'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('E-mail'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Password'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('All categories'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AllCategoryScreen()),
              );
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 24,
              height: 24,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaJF_xMHtne14FpDTmteAvk4C3A3D36HQ0KQ&s",
                fit: BoxFit.cover, // Ensure the image covers the SizedBox
              ),
            ),
            title: Text('Shirts'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ShirtsScreen()),
              );
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 24,
              height: 24,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgbeuY7_YzMIQqMvido3Ie4Wp0xEJfWARMucuZYj9QYePPq1L8SfF7Dnl7f-DWUKCCQ9c&usqp=CAU",
                fit: BoxFit.cover, // Ensure the image covers the SizedBox
              ),
            ),
            title: Text('Bottoms'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BottomsScreen()),
              );
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 24,
              height: 24,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRESLOGNtL9Z56pg8lMOVCJEYoMC7LwVi0bt8C6iZ8igqfr4uNKrhuxSJcEy-Pkh_-q9Xw&usqp=CAU",
                fit: BoxFit.cover, // Ensure the image covers the SizedBox
              ),
            ),
            title: Text('Shoes'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ShoesScreen()),
              );
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 24,
              height: 24,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE7E5K0-HT7T6EbvzHfLUGf5JA5uUrfa26nw&s",
                fit: BoxFit.cover, // Ensure the image covers the SizedBox
              ),
            ),
            title: Text('Heels'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HeelsScreen()),
              );
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 24,
              height: 24,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3ZBo9nlM9IoUV33yOEY3o_yibM95UOLAHeg&s",
                fit: BoxFit.cover, // Ensure the image covers the SizedBox
              ),
            ),
            title: Text('Accessories'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AccessoriesScreen()),
              );
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 24,
              height: 24,
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/88/88815.png",
                fit: BoxFit.cover, // Ensure the image covers the SizedBox
              ),
            ),
            title: Text('Tops'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TopsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
