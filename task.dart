import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _number1Controller = TextEditingController();
  TextEditingController _number2Controller = TextEditingController();
  List<String> _history = [];

  void _addNumbers() {
    int number1 = int.tryParse(_number1Controller.text) ?? 0;
    int number2 = int.tryParse(_number2Controller.text) ?? 0;
    int sum = number1 + number2;
    String historyEntry = "$number1 + $number2 = $sum";
    setState(() {
      _history.insert(0, historyEntry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 108, 42, 112),
        title: Text('Add Two Numbers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter First Number'),
            ),
            TextField(
              controller: _number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Second Number'),
            ),
            ElevatedButton (
              onPressed: _addNumbers,
              child: Text('Add'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 107, 42, 123)),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_history[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}