// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:studio_bookings/services/global_method.dart';


// class BookingFull extends StatefulWidget {
//   final String? productId;
//   const BookingFull({Key? key, this.productId}) : super(key: key);

//   @override
//   _BookingFullState createState() => _BookingFullState();
// }

// class _BookingFullState extends State<BookingFull> {
//   @override
//   Widget build(BuildContext context) {
//     final favsAttr = Provider.of<BookingAttr>(context);

//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           margin: EdgeInsets.only(
//             right: 30.0,
//             bottom: 10.0,
//           ),
//           child: Material(
//             color: Theme.of(context).backgroundColor,
//             borderRadius: BorderRadius.circular(5.0),
//             elevation: 3.0,
//             child: InkWell(
//               onTap: () {},
//               child: Container(
//                 padding: EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 80,
//                       child: Image(
//                         image: NetworkImage(favsAttr.imageUrl),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                         child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           favsAttr.title,
//                           style: TextStyle(
//                               fontSize: 16.0, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         Text(
//                           '\Ksh ${favsAttr.price}',
//                           style: TextStyle(
//                               fontSize: 18.0, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ))
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         positionedRemove(widget.productId),
//       ],
//     );
//   }

//   Widget positionedRemove(String? productId) {
//     final favsProvider = Provider.of<FavsProvider>(context);
//     GlobalMethod globalMethod = GlobalMethod();
//     return Positioned(
//       top: 20,
//       right: 15,
//       child: Container(
//         height: 30,
//         width: 30,
//         child: MaterialButton(
//           onPressed: () {
//             globalMethod.showDialogg(
//                 'Remove favourites!',
//                 'Are you sure you want to remove your favourite item?',
//                 () => favsProvider.removeItem(productId),
//                 context);
//           },
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//           padding: EdgeInsets.all(0.0),
//           color: Colors.blue,
//           child: Icon(
//             Icons.clear,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
