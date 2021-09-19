import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:studio_bookings/models/booking_service.dart';
import 'package:studio_bookings/screens/booking_page.dart';
import 'package:studio_bookings/screens/calendar.dart';
import 'package:studio_bookings/screens/mybookings/booking.dart';

class ContractScreen extends StatefulWidget {
  static const routeName = '/ContractScreen';
  const ContractScreen({Key? key}) : super(key: key);

  @override
  _ContractScreenState createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/Musique.jpg'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Musique fountain',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              contractText(
                  'We at Musique fountain studios, offer quality services and our terms of are as follows: '),
              SizedBox(
                height: 8,
              ),
              contractText(
                  'The recording services full pay is 25,000 If you (The client) should need training prior to the set recording date, an additional 10,000/- will be charged. If you wish to record one song at a time, each song will be charged @ 3,500/-. '),
              SizedBox(
                height: 8,
              ),
              contractText('The 25,000/- will be paid as follows'),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    contractText(
                        '•8,000/- will be paid up front as a deposit,'),
                    contractText(
                        '•10,000/-will be paid immediately after the recording session,'),
                    contractText('•7,000/-will be the last payment,'),
                    contractText('•Backup is charged at 4000/-,'),
                    contractText(
                        '•For clients stationed in the region between Nairobi and Mombasa a one way fare will be required'),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Checkbox(
                    //checkColor: Colors.greenAccent,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                        'I agree i have read and understood the terms and conditions',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              !isChecked
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey,
                          ),
                          child: InkWell(
                            onTap: () {},
                            splashColor: Theme.of(context).splashColor,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 8, bottom: 8),
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue,
                          ),
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, BookingScreens.routeName),
                            splashColor: Theme.of(context).splashColor,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 8, bottom: 8),
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contractText(
    String title,
  ) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}
