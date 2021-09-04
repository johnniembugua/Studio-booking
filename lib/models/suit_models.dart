import 'package:studio_bookings/widgets/reviews.dart';
import 'package:studio_bookings/widgets/service.dart';
import 'package:studio_bookings/widgets/studio_Location.dart';

class Suitable {
  String? id;
  String? imgUrl;
  double? price;
  double? rating;
  int? totalReview;
  String? title;
  String? categorie;
  String? description;

  Suitable(
      {this.description,
      this.id,
      this.imgUrl,
      this.price,
      this.rating,
      this.totalReview,
      this.title,
      this.categorie});
}

List<Suitable> listSuitable = [
  Suitable(
    id: "1",
    imgUrl: "https://picsum.photos/250?image=9",
    price: 1000,
    description: 'Drone services are the best services we offer in our market',
    categorie: "Drone services",
    rating: 4,
    totalReview: 220,
    title: "Drone services",
  ),
  Suitable(
    id: "2",
    imgUrl: "https://picsum.photos/250?image=9",
    price: 1500,
    categorie: "Video Shooting",
    description: 'Video shooting are the best services we offer in our market',
    rating: 5,
    totalReview: 520,
    title: "Video Shooting",
  ),
  Suitable(
    id: "3",
    imgUrl: "https://picsum.photos/250?image=9",
    price: 1020,
    categorie: "Audio Recording",
    rating: 3.5,
    description: 'Audio Recording are the best services we offer in our market',
    totalReview: 70,
    title: "Audio Recording",
  ),
  Suitable(
    id: "4",
    imgUrl: "https://picsum.photos/250?image=9",
    price: 985,
    categorie: "Video Editing",
    description: 'Video editing are the best services we offer in our market',
    rating: 2.5,
    totalReview: 140,
    title: "Video Editing",
  ),
];

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
