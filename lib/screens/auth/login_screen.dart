import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studio_bookings/screens/auth/social_button.dart';

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
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
      _formKey.currentState?.save();
      setState(() {
        _isLoading = true;
      });

      try {
        await _auth
            .signInWithEmailAndPassword(
                email: _emailAddress.toLowerCase().trim(),
                password: _password.trim())
            .then((value) =>
                Navigator.canPop(context) ? Navigator.pop(context) : null);
      } catch (error) {
        _globalMethods.authErrorHandle(error.toString(), context);
        print('error occured ${error.toString()}');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          var date = DateTime.now().toString();
          var dateparse = DateTime.parse(date);
          var formattedDate =
              "${dateparse.day}-${dateparse.month}-${dateparse.year}";
          final authResult = await _auth.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
          await FirebaseFirestore.instance
              .collection('users')
              .doc(authResult.user!.uid)
              .set({
            'id': authResult.user!.uid,
            'name': authResult.user!.displayName,
            'email': authResult.user!.email,
            //'phoneNumber': authResult.user.phoneNumber,
            'imageUrl': authResult.user!.photoURL,
            'joinedAt': formattedDate,
            'createdAt': Timestamp.now(),
          });
        } catch (error) {
          _globalMethods.authErrorHandle(error.toString(), context);
        }
      }
    }
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
                        if (value!.isEmpty || !value.contains('@gmail.com')) {
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
                          return 'Password must contain atleast 7 characters';
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
                      obscuringCharacter: '\u2749',
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
                      child: _isLoading
                          ? CircularProgressIndicator()
                          : TextButton(
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
                            onPressed: _googleSignIn,
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
