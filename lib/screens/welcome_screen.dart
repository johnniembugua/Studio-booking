import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'auth/login_screen.dart';
import 'auth/signup_screen.dart';
import 'auth/social_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/WelcomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Hero(
                tag: 'image',
                child: Image.asset('assets/images/welcome_image.png')),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Hero(
                  tag: 'text',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'App allows to take pictures of your'
                    ' receipts and save the receipt information',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: 'login_button',
                      child: TextButton(
                        onPressed: () => Navigator.of(context).push(
                          _buildPageRouteBuilder(),
                        ),
                        child: const Text('Login'),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          primary: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 18.0,
                          ),
                          shape: const StadiumBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Hero(
                      tag: 'signup_button',
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            _buildPageRouteBuilderForSignUp(),
                          );
                        },
                        child: const Text('Sign Up'),
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 18.0,
                          ),
                          shape: const StadiumBorder(),
                          side: const BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Or via social media'),
                    const SizedBox(height: 8.0),
                    Hero(
                      tag: 'social_buttons',
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SocialButton(
                            backgroundColor: Colors.blue,
                            icon: FontAwesomeIcons.facebookF,
                            onPressed: () {},
                          ),
                          SocialButton(
                            backgroundColor: Colors.red,
                            icon: FontAwesomeIcons.google,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36.0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PageRouteBuilder _buildPageRouteBuilder() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return LoginScreen();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: child,
        );
      },
      // transitionDuration: const Duration(seconds: 1),
      // reverseTransitionDuration: const Duration(seconds: 1),
    );
  }

  PageRouteBuilder _buildPageRouteBuilderForSignUp() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return SignUpScreen();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: child,
        );
      },
      // transitionDuration: const Duration(seconds: 1),
      // reverseTransitionDuration: const Duration(seconds: 1),
    );
  }
}
