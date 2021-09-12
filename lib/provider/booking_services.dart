import 'package:flutter/material.dart';
import 'package:studio_bookings/models/booking_service.dart';

class Bookings with ChangeNotifier {
  List<Booking> _bookings = [
    Booking(
      id: "1",
      imgUrl: "assets/images/welcome_image.png",
      price: 1000,
      description:
          'Drone services are the best services we offer in our market',
      categorie: "Drone services",
      rating: 4,
      totalReview: 220,
      title: "Drone services",
    ),
    Booking(
      id: "2",
      imgUrl: "assets/images/welcome_image.png",
      price: 1500,
      categorie: "Video Shooting",
      description:
          'Video shooting are the best services we offer in our market',
      rating: 5,
      totalReview: 520,
      title: "Video Shooting",
    ),
    Booking(
      id: "3",
      imgUrl: "assets/images/welcome_image.png",
      price: 1020,
      categorie: "Audio Recording",
      rating: 3.5,
      description:
          'Audio Recording are the best services we offer in our market',
      totalReview: 70,
      title: "Audio Recording",
    ),
    Booking(
      id: "4",
      imgUrl: "assets/images/welcome_image.png",
      price: 985,
      categorie: "Video Editing",
      description: 'Video editing are the best services we offer in our market',
      rating: 2.5,
      totalReview: 140,
      title: "Video Editing",
    ),
  ];

  List<Booking> get bookings {
    return _bookings;
  }

  Booking findById(String bookingId) {
    return _bookings.firstWhere((element) => element.id == bookingId);
  }
}
