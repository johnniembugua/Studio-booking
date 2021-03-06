import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:studio_bookings/provider/order_provider.dart';

import 'order_empty.dart';
import 'order_full.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/OrderScreen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   StripeService.init();
  // }

  // void payWithCard(int amount) async {
  //   ProgressDialog dialog = ProgressDialog(context);
  //   dialog.style(message: 'Please wait ...');
  //   await dialog.show();
  //   var response = await StripeService.payWithCard(
  //       currency: 'USD', amount: amount.toString());
  //   await dialog.hide();

  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(response.message),
  //     duration: Duration(milliseconds: response.success == true ? 1500 : 3000),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    //GlobalMethod globalMethod = GlobalMethod();
    final orderProvider = Provider.of<OrdersProvider>(context);

    return FutureBuilder(
        future: orderProvider.fetchOrders(),
        builder: (context, snapshot) {
          return orderProvider.getOrders.isEmpty
              ? Scaffold(
                  body: OrderEmpty(),
                )
              : Scaffold(
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).backgroundColor,
                    title: Text('Orders (${orderProvider.getOrders.length})'),
                    actions: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.trash),
                        onPressed: () {
                          // globalMethod.showDialogg(
                          //     'Clear all Orders!', 'Orders will be cancelled',
                          //     () async {
                          //   setState(() {
                          //     _isLoading = true;
                          //   });
                          //   // await FirebaseFirestore.instance
                          //   //     .collection('order')
                          //   //     .doc(orderAttr.orderId)
                          //   //     .delete();
                          // }, context);
                        },
                      )
                    ],
                  ),
                  body: Container(
                    margin: EdgeInsets.only(bottom: 60),
                    child: ListView.builder(
                      itemBuilder: (BuildContext ctx, int index) {
                        return ChangeNotifierProvider.value(
                            value: orderProvider.getOrders[index],
                            builder: (context, snapshot) {
                              return OrderFull();
                            });
                      },
                      itemCount: orderProvider.getOrders.length,
                    ),
                  ),
                );
        });
  }
}
