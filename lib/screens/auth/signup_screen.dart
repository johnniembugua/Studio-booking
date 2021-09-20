import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studio_bookings/screens/auth/social_button.dart';
import 'package:studio_bookings/screens/home_screen.dart';
import 'package:studio_bookings/services/global_method.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _passwordFocusNode = FocusNode();
  bool _obscureText = true;
  String _emailAddress = '';
  String _password = '';
  String _firstName = '';
  String _lastName = '';
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  GlobalMethod _globalMethods = GlobalMethod();
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final isValid = _formKey.currentState?.validate();

    FocusScope.of(context).unfocus();
    if (isValid == true) {
      _formKey.currentState!.save();
      Navigator.pushNamed(context, HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: Text(
                    'Sign Up!',
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        key: ValueKey('firstName'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please your first name';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_passwordFocusNode),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            //filled: true,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            labelText: 'firstName',
                            hintText: 'john'
                            //fillColor: Theme.of(context).backgroundColor,
                            ),
                        onSaved: (value) {
                          _firstName = value!;
                        },
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        key: ValueKey('lastName'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field cant be empty';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_passwordFocusNode),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            //filled: true,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            labelText: 'lastName',
                            hintText: 'Doe'
                            //fillColor: Theme.of(context).backgroundColor,
                            ),
                        onSaved: (value) {
                          _lastName = value!;
                        },
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        key: ValueKey('email'),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains(
                                '@gmail.com',
                              )) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_passwordFocusNode),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            //filled: true,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            labelText: 'Email Address',
                            hintText: 'john@gmail.com'
                            //fillColor: Theme.of(context).backgroundColor,
                            ),
                        onSaved: (value) {
                          _emailAddress = value!;
                        },
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        key: ValueKey('Password'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Please enter a valid Password';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        focusNode: _passwordFocusNode,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          //filled: true,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.blue,
                            ),
                          ),
                          labelText: 'Password',
                          hintText: 'Enter password',
                          //fillColor: Theme.of(context).backgroundColor
                        ),
                        onSaved: (value) {
                          _password = value!;
                        },
                        obscureText: _obscureText,
                        onEditingComplete: _submitForm,
                      ),
                      //const SizedBox(height: 8.0),
                      // Row(
                      //   children: [
                      //     const Spacer(),
                      //     TextButton(
                      //       onPressed: () {},
                      //       child: const Text('Forgot Password'),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 16.0),
                      Hero(
                        tag: 'signup_button',
                        child: TextButton(
                          onPressed: _submitForm,
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
                        child: const Text('Signup Via OTP'),
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
                        child: const Text('Already have an account? Sign in'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
