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
          title: const Text('Exercise 2'),
        ),
        body: const Center(
          child: CheckBoxWidget(),
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      if (value != null) {
        _isChecked = value;
      } else {
        _isChecked = false;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: _isChecked,
          onChanged: _toggleCheckbox,
        ),
        Text(
          _isChecked ? 'Checkbox is checked' : 'Checkbox is unchecked',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
