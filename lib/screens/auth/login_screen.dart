import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studio_bookings/screens/auth/social_button.dart';
import 'package:studio_bookings/screens/home_screen.dart';
import 'package:studio_bookings/services/global_method.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _passwordFocusNode = FocusNode();
  bool _obscureText = true;
  String _emailAddress = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  GlobalMethod _globalMethods = GlobalMethod();
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() async {
    //final isValid = _formKey.currentState!.validate();

    FocusScope.of(context).unfocus();
    Navigator.pushNamed(context, HomePage.routeName);
  }

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
              const Hero(
                tag: 'text',
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
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
                      key: ValueKey('email'),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          filled: true,
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email Address',
                          fillColor: Theme.of(context).backgroundColor),
                      onSaved: (value) {
                        _emailAddress = value!;
                      },
                    ),
                    const SizedBox(height: 8.0),
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
                          border: const UnderlineInputBorder(),
                          filled: true,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          labelText: 'Password',
                          fillColor: Theme.of(context).backgroundColor),
                      onSaved: (value) {
                        _password = value!;
                      },
                      obscureText: _obscureText,
                      onEditingComplete: _submitForm,
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
                      tag: 'login_button',
                      child: TextButton(
                        onPressed: _submitForm,
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
                    const SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Login Via OTP'),
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
                      child: const Text('Don\'t have an account? Sign Up'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
