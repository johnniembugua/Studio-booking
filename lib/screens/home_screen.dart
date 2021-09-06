import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:studio_bookings/models/booking_service.dart';

import 'package:studio_bookings/provider/booking_services.dart';
import 'package:studio_bookings/provider/theme_provider.dart';

import 'package:studio_bookings/widgets/drawer.dart';
import 'package:studio_bookings/widgets/service_widgets.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ratttting = 0;

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<Bookings>(context);
    List<Booking> listBooking = bookingProvider.bookings;
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    bool isDark = false;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  image: AssetImage("assest/images/woman.jpeg"),
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // SizedBox(
          //   height: 20.0,
          // ),
          Container(
            margin: EdgeInsets.only(right: 20.0, left: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome to your",
                      style: TextStyle(
                          color: Theme.of(context).indicatorColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Dream Studio",
                      style: TextStyle(
                          color: Theme.of(context).indicatorColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          fontSize: 30.0),
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.filter),
                    color: Colors.black45,
                    onPressed: () {
                      isDark = !isDark;
                    },
                  ),
                ),
                Switch(
                  value: themeProvider.darkTheme,
                  onChanged: (val) {
                    setState(() {
                      themeProvider.darkTheme = val;
                    });
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: listBooking.length,
            itemBuilder: (BuildContext context, int index) {
              //Booking suit = listBooking[index];
              return ChangeNotifierProvider.value(
                  value: listBooking[index],
                  builder: (context, snapshot) {
                    return ServicesWidget(
                        // widget.index:index,
                        );
                  });
            },
          ))
        ],
      ),
    );
  }
}
