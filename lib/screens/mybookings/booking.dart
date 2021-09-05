// import 'package:flutter/material.dart';

// class BookingScreens extends StatelessWidget {
//   static const routeName = '/BookingScreens';
//   const BookingScreens({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return favsProvider.getFavsItems.isEmpty
//         ? Scaffold(
//             body: WishListEmpty(),
//           )
//         : Scaffold(
//             appBar: AppBar(
//               title: Text('WishList (${favsProvider.getFavsItems.length})'),
//               actions: [
//                 IconButton(
//                     icon: Icon(MyAppIcons.trash),
//                     onPressed: () {
//                       globalMethod.showDialogg(
//                           'Clear wishlist!',
//                           'Your Wishlist Will be cleared',
//                           () => favsProvider.clearFavs(),
//                           context);
//                     })
//               ],
//             ),
//             body: ListView.builder(
//                 itemCount: favsProvider.getFavsItems.length,
//                 itemBuilder: (BuildContext ctx, int index) {
//                   return ChangeNotifierProvider.value(
//                       value: favsProvider.getFavsItems.values.toList()[index],
//                       child: WishlistFull(
//                         productId:
//                             favsProvider.getFavsItems.keys.toList()[index],
//                       ));
//                 }),
//           );
//   }
// }
