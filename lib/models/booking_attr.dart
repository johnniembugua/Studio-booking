import 'package:flutter/cupertino.dart';

class BookingAttr extends ChangeNotifier {
  final String? id;
  final String? title;
  final int price;
  final String? imageUrl;

  BookingAttr({this.id, this.title, required this.price, this.imageUrl});
}
