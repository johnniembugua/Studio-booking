import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  static const routeName = '/Contact';
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Contact Us",
          //style: TextStyle(color: Colors.orange),
        ),
        // backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                'https://github.com/devrajgaur/contact_us/blob/master/images/contact.jpg?raw=true',
                height: 200,
              ),
            ),
            Text(
              'If you need help, \n Feel free to contact us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //to bring down the containers a little bit lower from the text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Container 1

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    width: 120,
                    //color: Colors.white, //we cannot use it here because if you are using
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    child: Column(
                      children: [
                        Icon(
                          Icons.alternate_email,
                          color: Colors.orange,
                          size: 30,
                        ),
                        Text(
                          'Write to us',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          'help@gmail.com',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),

                //Container 2

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    width: 120,
                    //color: Colors.white, //we cannot use it here because if you are using
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.help_outline,
                          color: Colors.orange,
                          size: 25,
                        ),
                        Text(
                          'FAQS',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          'Frequently Asked Questions',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Container 3

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    width: 120,
                    //color: Colors.white, //we cannot use it here because if you are using
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          color: Colors.orange,
                          size: 30,
                        ),
                        Text(
                          'Phone Number',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '0797810081',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),

                //Container 4

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    width: 120,
                    //color: Colors.white, //we cannot use it here because if you are using
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.orange,
                          size: 30,
                        ),
                        Text(
                          'Location',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          'Bungoma',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Copyright @ 2021 , Musique Studios",
              style: TextStyle(color: Colors.orange),
            ),
            Text(
              "All Rights Reserved",
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
