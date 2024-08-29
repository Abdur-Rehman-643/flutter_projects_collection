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
          title: const Text('Exercise 4'),
        ),
        body: const TextFieldStatefull(),
      ),
    );
  }
}

class TextFieldStatefull extends StatefulWidget {
  const TextFieldStatefull({super.key});

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldStatefull> {
  String enteredText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          onChanged: (value) {
            setState(() {
              enteredText = value;
            });
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
          ),
        ),
        const SizedBox(height: 20.0),
        Text(
          'Entered text: $enteredText',
          style: const TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}
