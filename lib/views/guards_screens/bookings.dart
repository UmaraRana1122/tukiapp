import 'package:flutter/material.dart';

class Bookings extends StatefulWidget {
  final data;
  const Bookings({Key? key, required this.data}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("dwsax"),
            Text(widget.data.toString()),
          ],
        ),
      ),
    );
  }
}
