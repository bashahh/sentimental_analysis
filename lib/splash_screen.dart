import 'package:flutter/material.dart';

import 'Sentiments/start.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set timer for 4 seconds
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Start(title: 'Tweets Vibes',)),
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Image.asset(
            'images/cornaa.png', // Change to your background image path
            fit: BoxFit.cover,
          ),
          // Text
          Center(
            child: Text(
              'Splash Screen',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}