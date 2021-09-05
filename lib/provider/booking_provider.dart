// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:studio_bookings/models/booking_attr.dart';

// class OrdersProvider with ChangeNotifier {
//   List<BookingAttr> _bookings = [];
//   List<BookingAttr> get getBookings {
//     return [..._bookings];
//   }

//   Future<void> fetchOrders() async {
//     FirebaseAuth _auth = FirebaseAuth.instance;
//     User? _user = _auth.currentUser;
//     var _uid = _user!.uid;
//     print('the user Id is equal to $_uid');
//     try {
//       await FirebaseFirestore.instance
//           .collection('bookings')
//           .where('userId', isEqualTo: _uid)
//           .get()
//           .then((QuerySnapshot ordersSnapShot) {
//         _bookings.clear();
//         ordersSnapShot.docs.forEach((element) {
//           _bookings.insert(
//               0,
//               BookingAttr(
//                 orderId: element.get('orderId'),
//                 userId: element.get('userId'),
//                 productId: element.get('productId'),
//                 title: element.get('title'),
//                 imageUrl: element.get('imageUrl'),
//                 price: element.get('price'.toString()),
//                 quantity: element.get('quantity'.toString()),
//                 // orderDate: element.get('orderDate'),
//               ));
//         });
//       });
//     } catch (error) {
//       print('Error when fetching orders$error');
//     }
//     notifyListeners();
//   }
// }
