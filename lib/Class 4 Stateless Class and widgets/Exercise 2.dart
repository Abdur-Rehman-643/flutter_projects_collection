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
      theme: ThemeData
          .dark(), // Setting the dark theme to match the Google Chrome homepage
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Top row with Gmail, Images, icons, and user picture
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text('Gmail'),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      Text('Images'),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      Icon(Icons.apps),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/ABDUR REHMAN PICTURE.png'), // Correct usage of AssetImage
                        radius:
                            20, // Optional: You can adjust the radius as needed
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // Google text in the center
              const Center(
                child: Text(
                  'Google',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // Search bar with icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width:
                        600, // Adjust this value to set the width of the TextField
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.mic),
                            // SizedBox(width: 3),
                            // Icon(Icons.camera_alt),
                          ],
                        ),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Buttons for Google Search and I'm Feeling Lucky
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Google Search'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("I'm Feeling Lucky"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Text for languages
              const Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Google offered in: ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "اردو    پښتو",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  )
                ],
              )),
              const Spacer(),
              // Footer with text
              const Column(
                children: [
                  Divider(color: Colors.grey),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Pakistan'),
                          ],
                        ),
                        Divider(color: Colors.grey),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('About'),
                                SizedBox(width: 10),
                                Text('Advertising'),
                                SizedBox(width: 10),
                                Text('Business'),
                                SizedBox(width: 10),
                                Text('How Search works'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Privacy'),
                                SizedBox(width: 10),
                                Text('Terms'),
                                SizedBox(width: 10),
                                Text('Settings'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
