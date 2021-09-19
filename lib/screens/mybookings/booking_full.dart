import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_bookings/models/booking_attr.dart';
import 'package:studio_bookings/provider/booking_provider.dart';
import 'package:studio_bookings/services/global_method.dart';

class BookingFull extends StatefulWidget {
  final String productId;
  const BookingFull({Key? key, required this.productId}) : super(key: key);

  @override
  _BookingFullState createState() => _BookingFullState();
}

class _BookingFullState extends State<BookingFull> {
  @override
  Widget build(BuildContext context) {
    final bookingsAttr = Provider.of<BookingAttr>(context);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            right: 30.0,
            bottom: 10.0,
          ),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      child: Image.network('${bookingsAttr.imageUrl}'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${bookingsAttr.title}',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          '\Ksh ${bookingsAttr.price}',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(widget.productId),
      ],
    );
  }

  Widget positionedRemove(String? productId) {
    final bookingProvider = Provider.of<BookingProvider>(context);
    GlobalMethod globalMethod = GlobalMethod();
    return Positioned(
      top: 20,
      right: 15,
      child: Container(
        height: 30,
        width: 30,
        child: MaterialButton(
          onPressed: () {
            globalMethod.showDialogg(
                'Remove Booking!',
                'Are you sure you want to remove your booking item?',
                () => bookingProvider.removeBooking(widget.productId),
                context);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          padding: EdgeInsets.all(0.0),
          color: Colors.blue,
          child: Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
