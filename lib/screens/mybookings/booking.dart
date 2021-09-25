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
            bottomSheet: checkoutSection(context, bookingProvider.totalAmount),
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title:
                  Text('(${bookingProvider.getBookedItems.length}) Bookings '),
              actions: [
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.red,
                    ),
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

  Widget checkoutSection(BuildContext ctx, double subTotal) {
    //final bookingProvider = Provider.of<BookingProvider>(ctx);
    // var uuid = Uuid();
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () async {
                      // double amountInCents = subTotal * 1000;
                      // int integerAmount = (amountInCents / 10).ceil();
                      // await payWithCard(integerAmount);
                      // if (response.success == true) {
                      //   User user = _auth.currentUser;
                      //   final _uid = user.uid;
                      //   cartProvider.getCartItems
                      //       .forEach((key, orderValue) async {
                      //     final orderId = uuid.v4();
                      //     try {
                      //       await FirebaseFirestore.instance
                      //           .collection('order')
                      //           .doc(orderId)
                      //           .set({
                      //         'orderId': orderId,
                      //         'userId': _uid,
                      //         'productId': orderValue.productId,
                      //         'title': orderValue.title,
                      //         'price': orderValue.price * orderValue.quantity,
                      //         'imageUrl': orderValue.imageUrl,
                      //         'quantity': orderValue.quantity,
                      //         'orderDate': Timestamp.now(),
                      //       });
                      //     } catch (error) {
                      //       print('error occured $error');
                      //     }
                      //   });
                      // } else {
                      //   globalMethod.authErrorHandle(
                      //       'Please enter genuine credentials', context);
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              Theme.of(ctx).textSelectionTheme.selectionColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              'Total ',
              style: TextStyle(
                color: Theme.of(ctx).textSelectionTheme.selectionColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Ksh ${subTotal.toStringAsFixed(3)}',
              style: TextStyle(
                //color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
