import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:studio_bookings/models/booking_service.dart';
import 'package:studio_bookings/screens/details_screen.dart';

import 'StartRating.dart';

class ServicesWidget extends StatelessWidget {
  // const ServicesWidget({
  //   Key? key,
  //   required this.suit,
  // }) : super(key: key);

  // final Booking suit;

  @override
  Widget build(BuildContext context) {
    final bookingAttr = Provider.of<Booking>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailScreens.routeName, arguments: bookingAttr.id);
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => DetailScreen(suit)));
      },
      child: Container(
        height: 280.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 30.0,
              child: Container(
                width: 200.0,
                height: 260,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset.fromDirection(0.0, 0.2),
                        blurRadius: 18,
                      )
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        height: 260.0,
                        child: Hero(
                          tag: '${bookingAttr.id}',
                          child: Image.network(
                            '${bookingAttr.imgUrl}',
                            fit: BoxFit.cover,
                          ),

                          //     FadeInImage.assetNetwork(
                          //   placeholder: 'assets/images/bp_loading.gif',
                          //   image: '${bookingAttr.imgUrl}',
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      Positioned(
                          bottom: 0.0,
                          child: Container(
                            height: 50.0,
                            width: 180.0,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 16,
                                  offset: Offset.fromDirection(0.0, 0.2))
                            ]),
                          )),
                      Positioned(
                        bottom: 10.0,
                        right: 4.0,
                        left: 4.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 100.0,
                              child: Text(
                                '${bookingAttr.title}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: IconButton(
                                icon: Icon(FontAwesomeIcons.locationArrow),
                                onPressed: () {},
                                color: Colors.white,
                                iconSize: 15.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 170.0,
              left: 20.0,
              top: 30.0,
              child: Container(
                height: 160.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).accentColor,
                          offset: Offset.fromDirection(0.0, 0.2),
                          blurRadius: 5)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '${bookingAttr.categorie}',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Ksh ${bookingAttr.price}',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          " per hour",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        StarRating(
                          starCount: 5,
                          rating: bookingAttr.rating,
                          color: Colors.orange,
                          iconSize: 12.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '${bookingAttr.totalReview} reviews',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              image: AssetImage("assets/images/woman.jpeg"),
                              width: 30.0,
                              height: 30.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              image: AssetImage("assets/images/woman.jpeg"),
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Text(
                            "+99",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
