// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:studio_bookings/provider/theme_provider.dart';

// class BookingEmpty extends StatelessWidget {
//   const BookingEmpty({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final themeChange = Provider.of<DarkThemeProvider>(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           margin: EdgeInsets.only(top: 80),
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height * 0.4,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: AssetImage('assest/images/woman.jpeg'),
//             ),
//           ),
//         ),
//         Text(
//           'You havent made any booking yet',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 36,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Text(
//           'Explore our services and make a booking',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: themeChange.darkTheme
//                 ? Theme.of(context).disabledColor
//                 : Colors.grey,
//             fontSize: 26,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(
//           height: 30.0,
//         ),
//         Container(
//           width: MediaQuery.of(context).size.width * .9,
//           height: MediaQuery.of(context).size.height * 0.06,
//           child: RaisedButton(
//             onPressed: () {},
//             // onPressed: () =>
//             //     Navigator.of(context).pushNamed(FeedsScreen.routeName),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//               side: BorderSide(color: Colors.green),
//             ),
//             color: Colors.blue[800],
//             child: Text(
//               'Book Now'.toUpperCase(),
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 26,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }