import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrdersAttr with ChangeNotifier {
  final String orderId;
  final String userId;
  final String productId;
  final String title;
  final String imageUrl;
  final double? price;
  final int? quantity;
  final Timestamp? orderDate;

  OrdersAttr({
    this.orderDate,
    this.quantity,
    required this.orderId,
    required this.userId,
    required this.productId,
    required this.title,
    required this.imageUrl,
    this.price,
  });
}
