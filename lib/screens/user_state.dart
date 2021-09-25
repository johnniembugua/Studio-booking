import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studio_bookings/screens/home_screen.dart';
import 'package:studio_bookings/screens/welcome_screen.dart';

class UserState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        // ignore: missing_return
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (userSnapshot.connectionState == ConnectionState.active) {
            if (userSnapshot.hasData) {
              print('User is already logged in');
              return HomePage();
            } else {
              print('User didnt log in yet');
              return WelcomeScreen();
            }
          } else if (userSnapshot.hasError) {
            return Center(
              child: Text('Error Occured'),
            );
          }
          //return null;
          throw {userSnapshot.hasError.toString()};
        });
  }
}
