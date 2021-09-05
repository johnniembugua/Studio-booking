import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  static const routeName = '/BookingPage';
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Booking form'),
      ),
    );
  }
}
