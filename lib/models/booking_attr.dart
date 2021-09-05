import 'package:flutter/material.dart';

class BookingAttr with ChangeNotifier {
  final String? orderId;
  final String? userId;
  final String? productId;
  final String? title;
  final String? imageUrl;
  final double? price;
  final int? quantity;
  //final Timestamp orderDate;

  BookingAttr({
    //this.orderDate,
    this.quantity,
    this.orderId,
    this.userId,
    this.productId,
    this.title,
    this.imageUrl,
    this.price,
  });
}
