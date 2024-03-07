import 'dart:ui';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amount Edit Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AmountEditScreen(),
    );
  }
}

class AmountEditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amount Edit Example'),
      ),
      body: Center(
        child: CustomStatusTextField(
          amount: 500,
          isPaid: false,
        ),
      ),
    );
  }
}

class CustomStatusTextField extends StatefulWidget {
  final int amount;
  final bool isPaid;

  const CustomStatusTextField({
    Key? key,
    required this.amount,
    required this.isPaid,
  }) : super(key: key);

  @override
  _CustomStatusTextFieldState createState() => _CustomStatusTextFieldState();
}

class _CustomStatusTextFieldState extends State<CustomStatusTextField> {
  late int _currentAmount;

  @override
  void initState() {
    super.initState();
    _currentAmount = widget.amount;
  }

  void _editAmount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int newAmount = _currentAmount;

        return AlertDialog(
          title: Text('Edit Amount'),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter new amount'),
            onChanged: (value) {
              newAmount = int.tryParse(value) ?? _currentAmount;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _currentAmount = newAmount;
                });
                Navigator.of(context).pop(); // Close the alert
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _editAmount,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$$_currentAmount",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.isPaid ? "Paid" : "In Process",
                style: TextStyle(
                  color: widget.isPaid ? Colors.green : Colors.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
