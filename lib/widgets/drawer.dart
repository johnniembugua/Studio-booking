import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:studio_bookings/screens/orders/order.dart';
import 'package:studio_bookings/screens/welcome_screen.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? _uid;

  String? _firstName;

  String? _emailAddress;

  String? _joinedAt;

  String? _lastName;

  String? _userImageUrl;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    User? user = _auth.currentUser;
    _uid = user!.uid;
    user.email;
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    if (userDoc == null) {
      return;
    } else {
      setState(() {
        _firstName = userDoc.get('firstName');
        _lastName = userDoc.get('lastName');
        _emailAddress = user.email;
        _joinedAt = userDoc.get('createdAt');

        _userImageUrl = userDoc.get('imageUrl');
        //print('name $_name');
      });
    }
  }

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
                      backgroundImage: NetworkImage(
                          _userImageUrl ?? 'assets/images/welcome_image.png'),
                      radius: 50,
                    ),
                    SizedBox(width: 5),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$_firstName $_lastName ',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '@$_lastName',
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
                        Navigator.pushNamed(context, OrderScreen.routeName);
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
                    'Name', '$_firstName ', Icons.email_outlined, context),
                _listTileContent(
                    'Email', '$_emailAddress', Icons.near_me_outlined, context),
                _listTileContent('Phone ', '0797819981',
                    Icons.phone_android_outlined, context),
                _listTileContent('Joined ', '$_joinedAt',
                    Icons.create_new_folder_outlined, context),

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
                    child: ListTile(
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Image.network(
                                        'https://image.flaticon.com/icons/png/128/1828/1828304.png',
                                        height: 20.0,
                                        width: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text('Sign Out'),
                                    ),
                                  ],
                                ),
                                content: Text("Do you want to sign out?"),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel')),
                                  TextButton(
                                      onPressed: () async {
                                        await _auth.signOut().then(
                                            (value) => Navigator.pop(context));
                                      },
                                      child: Text('Ok')),
                                ],
                              );
                            });
                      },
                      title: Text('Logout'),
                      leading: Icon(Icons.exit_to_app_rounded),
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
