import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:studio_bookings/provider/booking_provider.dart';

import 'package:studio_bookings/provider/booking_services.dart';
import 'package:studio_bookings/screens/calendar.dart';

class DetailScreens extends StatefulWidget {
  static const routeName = '/DetailScreens';
  // final Booking suitable;

  // DetailScreens(this.suitable);

  @override
  _DetailScreensState createState() => _DetailScreensState();
}

class _DetailScreensState extends State<DetailScreens> {
  bool isLike = false;

  Icon icon = Icon(FontAwesomeIcons.solidHeart);

  //int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bookingData = Provider.of<Bookings>(context);
    final bookingId = ModalRoute.of(context)!.settings.arguments as String;
    final bookingProvider = Provider.of<BookingProvider>(context);
    final bookingAttr = bookingData.findById(bookingId);

    //final bookingList = bookingData.bookings;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            //was 300 0riginally
            pinned: true,
            flexibleSpace: ClipRRect(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(60.0)),
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Hero(
                        tag: '${bookingAttr.id}',
                        child: Image.network(
                          '${bookingAttr.imgUrl}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Consumer<BookingProvider>(
                      builder: (_, cart, ch) => Positioned(
                        bottom: 10,
                        right: 10,
                        child: Badge(
                          //badgeColor: ColorsConsts.cartBadgeColor,
                          animationType: BadgeAnimationType.slide,
                          toAnimate: true,
                          position: BadgePosition(top: 1, end: 1),
                          badgeContent: Text(
                            cart.getBookedItems.length.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.cartPlus,
                              color: Colors.blue,
                              //size: 30,
                              //color: ColorsConsts.cartColor,
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Calendar.routeName);
                            },
                          ),
                        ),
                      ),
                    ),
                    // Positioned(
                    //     bottom: 10,
                    //     right: 10,
                    //     child: FloatingActionButton(
                    //       child: icon,
                    //       onPressed: () {
                    //         setState(() {
                    //           isLike = !isLike;
                    //           icon = !isLike
                    //               ? Icon(FontAwesomeIcons.solidHeart)
                    //               : Icon(
                    //                   FontAwesomeIcons.solidHeart,
                    //                   color: Colors.red,
                    //                 );
                    //         });
                    //       },
                    //     ))
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${bookingAttr.title}',
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2),
                          ),
                          // SizedBox(
                          //   height: 10.0,
                          // ),
                          // Text('${bookingAttr.categorie}'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: [
                              Text(
                                'Standard Price',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                ' Ksh ${bookingAttr.price}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            'Extra days Ksh 1000/day',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //Text("Per hour"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  //_buildMenuBar(),
                  // _buidDescriptionTitle(),
                  // SizedBox(
                  //   height: 20.0,
                  // ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${bookingAttr.description}',
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  //_buildServiceBar(),
                  // SizedBox(
                  //   height: 30.0,
                  // ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(45.0),
                    child: ElevatedButton(
                      onPressed: () {
                        bookingProvider.addBookingtoCart(
                            bookingId,
                            bookingAttr.price,
                            bookingAttr.title,
                            bookingAttr.imgUrl);

                        //Navigator.pushNamed(context, Calendar.routeName);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[800]),
                      ),
                      child: Container(
                        width: 180,
                        height: 60.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 180.0,
                              child: Text(
                                bookingProvider.getBookedItems
                                        .containsKey(bookingId)
                                    ? 'Already added'
                                    : "Add to Booking",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // Container(
                            //   width: 60.0,
                            //   height: 60.0,
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(45.0),
                            //   ),
                            //   child: Icon(
                            //     Icons.arrow_forward_ios,
                            //     color: Colors.blue[800],
                            //     size: 21.0,
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
