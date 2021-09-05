import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_bookings/provider/bookings.dart';

import 'Screens/home_screen.dart';
import 'consts/theme_data.dart';
import 'provider/theme_provider.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
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
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          //themeMode: themeMode, // Change it
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),

          home: HomePage(),
        );
      }),
    );
  }
}
