import 'package:first_mini_project/third_project/Main Screen Drawer.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String name;
  final String email;

  const MainScreen({super.key, required this.name, required this.email});

  Widget _buildProductContainer(String imageUrl, String title, String price) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              width: 160,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF626bFC),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryContainer(
      String imageUrl, String title, String description) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 250, // Adjust image height as needed
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandContainer(String imageUrl) {
    return SizedBox(
      width: 110,
      height: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageUrl, width: 100, height: 100, fit: BoxFit.contain),
          // SizedBox(height: 8),
          // Text(
          //   brandName,
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }

  Widget _buildProductItem(
      {required String imageUrl,
      required String price,
      required String description}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
              // height: 200, // Adjust height as needed
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true, // Center aligns the title
        title: const Text(
          'Shopsie',
          style: TextStyle(color: Colors.blue, fontSize: 25),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle,
                color: Colors.black), // Profile icon
            onPressed: () {},
          ),
        ],
      ),
      drawer: CustomMainScreenDrawer(name: name, email: email),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/1.png',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 600,
                      ),
                    ),
                    /*Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          child: Text(
                            'Shop Now',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
            // Trending Now Section
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Center(
                  child: Text(
                    'Trending Now',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Chip(
                      label: Text(
                        'All',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color(0xFF626bFC),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Chip(label: Text('Dresses')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Chip(label: Text('Accessories')),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildProductContainer(
                    'assets/images/2.png',
                    'Plain Dress',
                    'Rs. 13,000',
                  ),
                  _buildProductContainer(
                    'assets/images/3.png',
                    'Heel Shoes',
                    'Rs. 20,000',
                  ),
                  _buildProductContainer(
                    'assets/images/image2.jpeg',
                    'Redmi 13C',
                    'Rs. 28,499',
                  ),
                  _buildProductContainer(
                    'assets/images/2.png',
                    'Plain Dress',
                    'Rs. 13,000',
                  ),
                  _buildProductContainer(
                    'assets/images/3.png',
                    'Heel Shoes',
                    'Rs. 20,000',
                  ),
                  _buildProductContainer(
                    'assets/images/image2.jpeg',
                    'Redmi 13C',
                    'Rs. 28,499',
                  ),
                  _buildProductContainer(
                    'assets/images/2.png',
                    'Plain Dress',
                    'Rs. 13,000',
                  ),
                  _buildProductContainer(
                    'assets/images/3.png',
                    'Heel Shoes',
                    'Rs. 20,000',
                  ),
                  _buildProductContainer(
                    'assets/images/image2.jpeg',
                    'Redmi 13C',
                    'Rs. 28,499',
                  )
                ],
              ),
            ),
            // Actual Categories Section
            Container(
              margin: const EdgeInsets.all(20),
              child: Container(
                  child: const Center(
                child: Text(
                  'Actual Categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )),
            ),
            Center(
              child: SizedBox(
                height: 1030,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildCategoryContainer(
                      'assets/images/4.png',
                      'Leather Shoes',
                      'Shoes, Sandal, etc',
                    ),
                    const SizedBox(height: 16),
                    _buildCategoryContainer(
                      'assets/images/5.png',
                      'Light Dresses',
                      'Evening, Casual, Home',
                    ),
                    const SizedBox(height: 16),
                    _buildCategoryContainer(
                      'assets/images/6.jpg',
                      'Outerwear',
                      'Raincoats, Sweaters, etc',
                    ),
                    // SizedBox(height: 20)
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Center(
                child: Container(
                  child: const Text(
                    'Only Trusted Brands',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    // margin: EdgeInsets.symmetric(vertical: 3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildBrandContainer('assets/images/tiffany.jpg'),
                        _buildBrandContainer('assets/images/dolce.jpg'),
                        _buildBrandContainer('assets/images/rolex.png'),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildBrandContainer('assets/images/gucci.jpg'),
                        _buildBrandContainer('assets/images/fendi.png'),
                        _buildBrandContainer('assets/images/prada.jpg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Container(
                height: 700,
                color: Colors.deepPurple,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'NEW ARRIVAL\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'FALL 2021',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(150.0),
                          topRight: Radius.circular(150.0),
                        ),
                        child: Image.asset(
                          'assets/images/image4.jpg',
                          fit: BoxFit.fill,
                          // width: 350,
                          // height: 500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: Text(
                              'Explore',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Center(
                      child: Text(
                        'RECOMMENDED LOOKS FOR YOU',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Gender: '),
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem(
                              value: 'Female', child: Text('Female')),
                          DropdownMenuItem(value: 'Male', child: Text('Male')),
                        ],
                        onChanged: (value) {},
                        hint: const Text('Female'),
                      ),
                      const SizedBox(width: 10),
                      const Text('Style: '),
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem(
                              value: 'Partywear', child: Text('Partywear')),
                          DropdownMenuItem(
                              value: 'Casual', child: Text('Casual')),
                        ],
                        onChanged: (value) {},
                        hint: const Text('Partywear'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Price range: '),
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem(value: 'All', child: Text('All')),
                          DropdownMenuItem(value: 'Low', child: Text('Low')),
                          DropdownMenuItem(value: 'High', child: Text('High')),
                        ],
                        onChanged: (value) {},
                        hint: const Text('All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/images/image5.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'In This look',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Items List
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        _buildProductItem(
                          imageUrl: 'assets/images/image5.jpg',
                          price: '\$43.90',
                          description: 'Cotton black dress',
                        ),
                        const SizedBox(height: 10),
                        _buildProductItem(
                          imageUrl: 'assets/images/image6.jpeg',
                          price: '\$12.50',
                          description: 'Saddle shoulder bag with hardware',
                        ),
                        const SizedBox(height: 10),
                        _buildProductItem(
                          imageUrl: 'assets/images/7.png',
                          price: '\$99.30',
                          description: 'Leather shoes',
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF626bFC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        child: Text('Buy It Now',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Footer Section
            Container(
              child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  color: Colors.black12,
                  child: Center(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/images/image7.jpeg',
                            width: 300,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Text Section
                        const Text(
                          'GET 20% OFF',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Leave your email and get a discount',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Email Subscription Section
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: 'Email',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 8),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  controller:
                                      TextEditingController(text: email),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.blue,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 16),
                                  child: Text(
                                    'Subscribe',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Footer Section
                        Container(
                          color: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                '© 2021 Shopsie',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              SizedBox(width: 90),
                              Text(
                                'Privacy & Cookies',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Ts&Cs',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
