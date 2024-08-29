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
          title: const Text('Exercise 2 Radio Button Form'),
        ),
        body: const QuestionForm(),
      ),
    );
  }
}

class QuestionForm extends StatefulWidget {
  const QuestionForm({super.key});

  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  List<int> _selectedOptions = List.filled(5, -1);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (int i = 0; i < 5; i++)
              QuestionCard(
                questionIndex: i,
                selectedOption: _selectedOptions[i],
                onChanged: (value) {
                  setState(() {
                    _selectedOptions[i] = value!;
                  });
                },
              ),
            ElevatedButton(
              onPressed: () {
                if (_selectedOptions.contains(-1)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please answer all questions.')),
                  );
                } else {
                  setState(() {
                    _selectedOptions = List.filled(5, -1);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form submitted successfully!')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final int questionIndex;
  final int selectedOption;
  final ValueChanged<int?> onChanged;

  const QuestionCard({super.key, 
    required this.questionIndex,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${questionIndex + 1}',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            for (int i = 0; i < 4; i++)
              RadioListTile<int>(
                title: Text('Option ${i + 1}'),
                value: i,
                groupValue: selectedOption,
                onChanged: onChanged,
              ),
          ],
        ),
      ),
    );
  }
}
