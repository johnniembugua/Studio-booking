import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studio_bookings/screens/auth/social_button.dart';
import 'package:studio_bookings/screens/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
               Material(
                  type: MaterialType.transparency,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
               
              ),
              Expanded(
                child: Hero(
                    tag: 'image',
                    child: Image.asset('assets/images/login_image.png')),
              ),
              const CupertinoTextField(
                prefix: Icon(
                  Icons.mail_outline,
                  color: Colors.blue,
                ),
                suffix: Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                style: TextStyle(color: Colors.blue),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const CupertinoTextField(
                obscureText: true,
                prefix: Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
                suffix: Icon(
                  Icons.visibility_off,
                  color: Colors.blue,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                style: TextStyle(color: Colors.blue),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Hero(
                tag: 'signup_button',
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HomePage.routeName);
                  },
                  child: const Text('Signup'),
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
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {},
                child: const Text('SignUp Via OTP'),
              ),
              const SizedBox(height: 16.0),
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
              const SizedBox(height: 16.0),
              GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Text('Already have an account? Log in')),
            ],
          ),
        ),
      ),
    );
  }
}
