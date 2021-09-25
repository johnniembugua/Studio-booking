import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studio_bookings/screens/auth/social_button.dart';
import 'package:studio_bookings/services/global_method.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  bool _obscureText = true;
  String _emailAddress = '';
  String _password = '';
  String _firstName = '';
  String _lastName = '';
  File? _pickedImage;
  late String url;

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalMethod _globalMethods = GlobalMethod();
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    var date = DateTime.now().toString();
    var dateparse = DateTime.parse(date);
    var formattedDate = "${dateparse.day}-${dateparse.month}-${dateparse.year}";
    if (isValid) {
      _formKey.currentState?.save();
      setState(() {
        _isLoading = true;
      });

      try {
        if (_pickedImage == null) {
          _globalMethods.authErrorHandle('Please pick an image', context);
        } else {
          setState(() {
            _isLoading = true;
          });
          final ref = FirebaseStorage.instance
              .ref()
              .child('usersImages')
              .child(_emailAddress + '.jpg');
          await ref.putFile(_pickedImage!);
          url = await ref.getDownloadURL();
          await _auth.createUserWithEmailAndPassword(
              email: _emailAddress.toLowerCase().trim(),
              password: _password.trim());
          final User? user = _auth.currentUser;
          final _uid = user!.uid;
          user.updatePhotoURL(url);
          user.updateDisplayName(_firstName);
          //user.updateProfile(photoURL: url, displayName: _fullName);
          user.reload();
          await FirebaseFirestore.instance.collection('users').doc(_uid).set({
            'id': _uid,
            'firstName': _firstName,
            'emailAddress': _emailAddress,
            'lastName': _lastName,
            'imageUrl': url,
            'joinedAt': formattedDate,
            'createdAt': Timestamp.now(),
          });
          // ignore: unnecessary_statements
          Navigator.canPop(context) ? Navigator.pop(context) : null;
        }
      } catch (error) {
        _globalMethods.authErrorHandle('$error', context);
        print('error occured $error');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _remove() {
    setState(() {
      _pickedImage == null;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  // Material(
                  //   type: MaterialType.transparency,
                  //   child: Text(
                  //     'Sign Up!',
                  //     style: TextStyle(
                  //       fontSize: 24.0,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Hero(
                  //       tag: 'image',
                  //       child: Image.asset('assets/images/login_image.png')),
                  // ),
                  Stack(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                        child: CircleAvatar(
                          radius: 71,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.blueAccent,
                            backgroundImage: _pickedImage == null
                                ? null
                                : FileImage(_pickedImage!),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 120,
                          left: 110,
                          child: RawMaterialButton(
                            elevation: 10,
                            //fillColor: ColorsConsts.gradiendLEnd,
                            child: Icon(Icons.add_a_photo),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Choose option',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          // color: ColorsConsts.gradiendLStart,
                                        ),
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: [
                                            InkWell(
                                              onTap: _pickImageCamera,
                                              splashColor: Colors.purpleAccent,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(
                                                      Icons.camera,
                                                      color:
                                                          Colors.purpleAccent,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Camera',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      // color:
                                                      //     ColorsConsts.title,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: _pickImageGallery,
                                              splashColor: Colors.purpleAccent,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(
                                                      Icons.image,
                                                      color:
                                                          Colors.purpleAccent,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Gallery',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      // color:
                                                      //     ColorsConsts.title,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: _remove,
                                              splashColor: Colors.purpleAccent,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(
                                                      Icons.remove_circle,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Remove',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.red),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ))
                    ],
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
                              .requestFocus(_emailFocusNode),
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
                              .requestFocus(_emailFocusNode),
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
                          obscuringCharacter: '\u2749',
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
        ]),
      ),
    );
  }
}
