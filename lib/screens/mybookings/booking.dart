import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:studio_bookings/provider/booking_provider.dart';
import 'package:studio_bookings/screens/mybookings/booking_full.dart';
import 'package:studio_bookings/services/global_method.dart';

import 'booking_empty.dart';

class BookingScreens extends StatelessWidget {
  static const routeName = '/BookingScreens';
  const BookingScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context);
    GlobalMethod globalMethod = GlobalMethod();

    return bookingProvider.getBookedItems.isEmpty
        ? Scaffold(
            body: BookingEmpty(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title:
                  Text('(${bookingProvider.getBookedItems.length}) Bookings '),
              actions: [
                IconButton(
                    icon: Icon(FontAwesomeIcons.trash),
                    onPressed: () {
                      globalMethod.showDialogg(
                          'Clear Bookings!',
                          'Your Bookings Will be cleared',
                          () => bookingProvider.clearBookings(),
                          context);
                    })
              ],
            ),
            body: ListView.builder(
                itemCount: bookingProvider.getBookedItems.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return ChangeNotifierProvider.value(
                      value:
                          bookingProvider.getBookedItems.values.toList()[index],
                      child: BookingFull(
                        productId:
                            bookingProvider.getBookedItems.keys.toList()[index],
                      ));
                }),
          );
  }
}
