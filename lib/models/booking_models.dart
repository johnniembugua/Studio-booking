import 'package:flutter/cupertino.dart';
import 'package:studio_bookings/widgets/reviews.dart';
import 'package:studio_bookings/widgets/service.dart';
import 'package:studio_bookings/widgets/studio_Location.dart';

class Booking with ChangeNotifier {
  final String? id;
  final String? imgUrl;
  final double? price;
  final double? rating;
  final int? totalReview;
  final String? title;
  final String? categorie;
  final String? description;

  Booking(
      {this.description,
      this.id,
      this.imgUrl,
      this.price,
      this.rating,
      this.totalReview,
      this.title,
      this.categorie});
}

List<String> listString = [
  //"Category",
  "Service",
  "Reviews",
  "Studio Location",
];

Map listRoutes = {
  'Service': Service(),
  'Reviews': Reviews(),
  'StudioLocation': StudioLocation(),
};
