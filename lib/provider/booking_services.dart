import 'package:flutter/material.dart';
import 'package:studio_bookings/models/booking_service.dart';

class Bookings with ChangeNotifier {
  List<Booking> _bookings = [
    Booking(
      id: "1",
      imgUrl:
          "https://cdn.pixabay.com/photo/2016/09/10/11/42/quadrocopter-1658967_960_720.png",
      price: 5000,
      description:
          'Drone services are the best services we offer in our market',
      categorie: "Drone services",
      rating: 4,
      totalReview: 220,
      title: "Drone services",
    ),
    Booking(
      id: "2",
      imgUrl:
          "https://cdn.pixabay.com/photo/2016/11/29/03/53/camera-1867184_960_720.jpg",
      price: 4500,
      categorie: "Video Shooting",
      description:
          'Video shooting are the best services we offer in our market',
      rating: 5,
      totalReview: 520,
      title: "Video Shooting",
    ),
    Booking(
      id: "3",
      imgUrl:
          "https://cdn.pixabay.com/photo/2020/04/15/14/45/microphone-5046876_960_720.jpg",
      price: 3000,
      categorie: "Audio Recording",
      rating: 3.5,
      description:
          'Audio Recording are the best services we offer in our market',
      totalReview: 70,
      title: "Audio Recording",
    ),
    Booking(
      id: "4",
      imgUrl:
          "https://cdn.pixabay.com/photo/2013/07/12/15/33/cutting-150066_960_720.png",
      price: 4000,
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
