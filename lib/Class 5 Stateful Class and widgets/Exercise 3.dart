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
          title: const Text('Exercise 3'),
        ),
        body: const Stateful_Switch(),
      ),
    );
  }
}

class Stateful_Switch extends StatefulWidget {
  const Stateful_Switch({super.key});

  @override
  _SwitchState createState() => _SwitchState();
}

class _SwitchState extends State<Stateful_Switch> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Switch(
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            _switchValue ? 'Switch is ON' : 'Switch is OFF',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
