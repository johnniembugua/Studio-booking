import 'package:flutter/material.dart';
import 'package:studio_bookings/models/booking_attr.dart';

class BookingProvider with ChangeNotifier {
  Map<String, BookingAttr> _bookedItems = {};

  Map<String, BookingAttr> get getBookedItems {
    return _bookedItems;
  }

  double get totalAmount {
    var total = 0.0;
    _bookedItems.forEach((key, value) {
      total += value.price;
    });
    return total;
  }

  void addBookingtoCart(
      String bookingId, int price, String title, String imageUrl) {
    if (_bookedItems.containsKey(bookingId)) {
      _bookedItems.update(
          bookingId,
          (existingBookedItem) => BookingAttr(
                id: existingBookedItem.id,
                price: existingBookedItem.price,
                title: existingBookedItem.title,
                imageUrl: existingBookedItem.imageUrl,
              ));
    } else {
      _bookedItems.putIfAbsent(
          bookingId,
          () => BookingAttr(
                id: DateTime.now().toString(),
                price: price,
                title: title,
                imageUrl: imageUrl,
              ));
    }
    notifyListeners();
  }

  void removeBooking(String bookingId) {
    _bookedItems.remove(bookingId);
    notifyListeners();
  }

  void clearBookings() {
    _bookedItems.clear();
    notifyListeners();
  }
}
