import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studio_bookings/screens/mybookings/booking.dart';
import 'package:studio_bookings/screens/welcome_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      backgroundImage:
                          AssetImage('assets/images/welcome_image.png'),
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
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Theme.of(context).splashColor,
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, BookingScreens.routeName);
                      },
                      title: Text(
                        'My Bookings',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      trailing: Icon(Icons.chevron_right_rounded),
                      leading: Icon(
                        FontAwesomeIcons.bookOpen,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                _listTileContent(
                    'Name', 'Nanjala', Icons.email_outlined, context),
                _listTileContent(
                    'UserName', '@nanjala', Icons.near_me_outlined, context),
                _listTileContent('Phone ', '0797819981',
                    Icons.phone_android_outlined, context),

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
                    'Notifications', "", Icons.notifications_outlined, context),
                _listTileContent(
                    'Privacy', '', Icons.privacy_tip_outlined, context),
                _listTileContent(
                    'Language', 'English', Icons.language, context),
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
                // _listTileContent('Logout', "", Icons.logout_outlined, context),

                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Theme.of(context).splashColor,
                    onTap: () {
                      Navigator.canPop(context)
                          ? Navigator.pushNamed(
                              context, WelcomeScreen.routeName)
                          : null;
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _listTileContent(
      String text, String details, IconData icon, BuildContext context) {
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
