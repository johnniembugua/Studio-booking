import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:studio_bookings/provider/booking_services.dart';
import 'package:studio_bookings/screens/booking_page.dart';

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
                        child: Image(
                          image: NetworkImage('${bookingAttr.imgUrl}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: FloatingActionButton(
                          child: icon,
                          onPressed: () {
                            setState(() {
                              isLike = !isLike;
                              icon = !isLike
                                  ? Icon(FontAwesomeIcons.solidHeart)
                                  : Icon(
                                      FontAwesomeIcons.solidHeart,
                                      color: Colors.red,
                                    );
                            });
                          },
                        ))
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
                        children: <Widget>[
                          Text(
                            '${bookingAttr.title}',
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('${bookingAttr.categorie}'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Ksh ${bookingAttr.price}',
                            style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("Per hour"),
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
                  _buildBookButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // _buildMenuBar() {
  //   return Container(
  //     height: 45.0,
  //     child: ListView.builder(
  //       itemCount: listString.length,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (BuildContext context, int index) {
  //         String menu = listString[index];
  //         return GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               _selectedIndex = index;
  //             });
  //           },
  //           child: Container(
  //             margin: EdgeInsets.only(right: 40.0),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Text(
  //                   menu,
  //                   style: TextStyle(
  //                       fontSize: 20.0,
  //                       color: _selectedIndex == index
  //                           ? Theme.of(context).accentColor
  //                           : Colors.grey),
  //                 ),
  //                 SizedBox(
  //                   height: 5.0,
  //                 ),
  //                 _selectedIndex == index
  //                     ? Container(
  //                         color: Theme.of(context).accentColor,
  //                         height: 4.0,
  //                         width: 30.0,
  //                       )
  //                     : SizedBox.shrink()
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // _buildServiceBar() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: <Widget>[
  //       Column(
  //         children: <Widget>[
  //           Container(
  //             width: 70.0,
  //             height: 70.0,
  //             decoration: BoxDecoration(
  //                 color: Colors.blue[100],
  //                 borderRadius: BorderRadius.circular(45.0)),
  //             child: Icon(
  //               FontAwesomeIcons.bath,
  //               color: Colors.blueAccent,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 10.0,
  //           ),
  //           Text("Bathroom"),
  //           SizedBox(
  //             height: 10.0,
  //           ),
  //           Text(
  //             "12 sqft",
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
  //           ),
  //         ],
  //       ),
  //       Column(
  //         children: <Widget>[
  //           Container(
  //             width: 70.0,
  //             height: 70.0,
  //             decoration: BoxDecoration(
  //                 color: Colors.blue[100],
  //                 borderRadius: BorderRadius.circular(45.0)),
  //             child: Icon(
  //               FontAwesomeIcons.bed,
  //               color: Colors.blueAccent,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 10.0,
  //           ),
  //           Text("BedRoom"),
  //           SizedBox(
  //             height: 10.0,
  //           ),
  //           Text(
  //             "20 sqft",
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
  //           ),
  //         ],
  //       ),
  //       Column(
  //         children: <Widget>[
  //           Container(
  //             width: 70.0,
  //             height: 70.0,
  //             decoration: BoxDecoration(
  //                 color: Colors.blue[100],
  //                 borderRadius: BorderRadius.circular(45.0)),
  //             child: Icon(
  //               FontAwesomeIcons.dollyFlatbed,
  //               color: Colors.blueAccent,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 10.0,
  //           ),
  //           Text("Livingroom"),
  //           SizedBox(
  //             height: 10.0,
  //           ),
  //           Text(
  //             "80 sqft",
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  _buildBookButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(45.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BookingPage()));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
        ),
        child: Container(
          width: 180.0,
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 120.0,
                child: Text(
                  "Book now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(45.0),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue[800],
                  size: 21.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
