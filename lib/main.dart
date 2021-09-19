import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_bookings/provider/booking_provider.dart';

import 'package:studio_bookings/provider/booking_services.dart';
import 'package:studio_bookings/screens/booking_page.dart';
import 'package:studio_bookings/screens/calendar.dart';
import 'package:studio_bookings/screens/contract_form.dart';
import 'package:studio_bookings/screens/details_screen.dart';
import 'package:studio_bookings/screens/mybookings/booking.dart';
import 'package:studio_bookings/screens/welcome_screen.dart';

import 'Screens/home_screen.dart';
import 'consts/theme_data.dart';
import 'provider/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
        ChangeNotifierProvider(
          create: (_) => Bookings(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookingProvider(),
        ),
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          //themeMode: themeMode, // Change it
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),

          home: WelcomeScreen(),
          routes: {
            HomePage.routeName: (context) => HomePage(),
            DetailScreens.routeName: (context) => DetailScreens(),
            BookingScreens.routeName: (context) => BookingScreens(),
            BookingPage.routeName: (context) => BookingPage(),
            WelcomeScreen.routeName: (context) => WelcomeScreen(),
            ContractScreen.routeName: (context) => ContractScreen(),
            Calendar.routeName: (context)=>Calendar(),
          },
        );
      }),
    );
  }
}
