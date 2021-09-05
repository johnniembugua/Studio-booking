import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:studio_bookings/models/booking_models.dart';
import 'package:studio_bookings/provider/bookings.dart';
import 'package:studio_bookings/provider/theme_provider.dart';
import 'package:studio_bookings/widgets/StartRating.dart';
import 'package:studio_bookings/widgets/drawer.dart';

import 'details_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ratttting = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    bool isDark = false;
    return Scaffold(
      drawer: _buildDrawer(),
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
          Expanded(child: _buildListView())
        ],
      ),
    );
  }

  _buildImageListView(Booking suit) {
    return Positioned(
      right: 30.0,
      child: Container(
        width: 200.0,
        height: 260,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset.fromDirection(0.0, 0.2),
                blurRadius: 18,
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: 260.0,
                child: Hero(
                  tag: '${suit.id}',
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assest/images/bp_loading.gif',
                    image: '${suit.imgUrl}',
                    //'https://picsum.photos/250?image=9',
                    //'${suit.imgUrl}',
                    // AssetImage(
                    //   '${suit.imgUrl}',
                    // ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 50.0,
                    width: 180.0,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 16,
                          offset: Offset.fromDirection(0.0, 0.2))
                    ]),
                  )),
              Positioned(
                bottom: 10.0,
                right: 4.0,
                left: 4.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Text(
                        '${suit.title}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.locationArrow),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: 15.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildBoxInfo(Booking suit) {
    return Positioned(
      right: 170.0,
      left: 20.0,
      top: 30.0,
      child: Container(
        height: 160.0,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).accentColor,
                  offset: Offset.fromDirection(0.0, 0.2),
                  blurRadius: 5)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Text(
              '${suit.categorie}',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Ksh ${suit.price}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                ),
                Text(
                  " per hour",
                  style: TextStyle(),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StarRating(
                  starCount: 5,
                  rating: suit.rating,
                  color: Colors.orange,
                  iconSize: 12.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  '${suit.totalReview} reviews',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.0),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage("assest/images/woman.jpeg"),
                      width: 30.0,
                      height: 30.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage("assest/images/woman.jpeg"),
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: Text(
                    "+99",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildListView() {
    //final bookingAttr = Provider.of<Book>(context);
    final bookingProvider = Provider.of<Bookings>(context);
    List<Booking> listBooking = bookingProvider.bookings;
    return ListView.builder(
      itemCount: listBooking.length,
      itemBuilder: (BuildContext context, int index) {
        Booking suit = listBooking[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DetailScreen(suit)));
          },
          child: Container(
            height: 280.0,
            child: Stack(
              children: <Widget>[
                _buildImageListView(suit),
                _buildBoxInfo(suit)
              ],
            ),
          ),
        );
      },
    );
  }

  _buildDrawer() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assest/images/woman.jpeg'),
                      radius: 50,
                    ),
                    SizedBox(width: 5),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Faith Nanjala',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '@nanjala',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ])
                  ],
                ),

                SizedBox(height: 15),

                _listTileContent('Name', 'Nanjala', Icons.email_outlined),
                _listTileContent(
                    'UserName', '@nanjala', Icons.near_me_outlined),
                _listTileContent(
                    'Phone ', '0797819981', Icons.phone_android_outlined),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                _listTileContent(
                    'Notifications', "", Icons.notifications_outlined),
                _listTileContent('Privacy', '', Icons.privacy_tip_outlined),
                _listTileContent('Language', 'English', Icons.language),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                _listTileContent('Logout', "", Icons.logout_outlined),

                // ListTile(
                //   leading: Icon(
                //     Icons.logout,
                //     color: Colors.black,
                //   ),
                //   title: Text(
                //     'Logout',
                //     style: TextStyle(
                //         fontSize: 15,
                //         fontWeight: FontWeight.w200,
                //         color: Colors.black),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _listTileContent(String text, String details, IconData icon) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Flexible(
                child: Text(
                  details,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
