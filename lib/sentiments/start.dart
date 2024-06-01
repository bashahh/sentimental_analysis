
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:disease_breakout_analysis/auth//login.dart';
import 'package:disease_breakout_analysis/auth//signup.dart';

class Start extends StatefulWidget {
  const Start({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Container(
          // width: 360,
          // height: 640,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/login.png'),
                fit: BoxFit.cover,
              ),
              color: Color(0xFFC1C1C1)),
          child: Stack(
            children: [
              Positioned(
                left: 129,
                top: 100,
                child: Container(
                  width: 102,
                  height: 91,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://i.ibb.co/8KRYK6m/tweet-Vibeicon-png.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 116,
                top: 198,
                child: SizedBox(
                  width: 128,
                  height: 57,
                  child: Text(
                    'TweetVibe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 64,
                top: 320,
                child: Container(
                  width: 232,
                  height: 44.12,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 232,
                          height: 44.12,
                          child: ElevatedButton(
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 2.5,
                              ),
                            ),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(),
                                  )),
                              print("sign up button pressed")
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(28, 113, 160, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 64,
                top: 399,
                child: Container(
                  width: 232,
                  height: 44.12,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 232,
                          height: 44.12,
                          child: ElevatedButton(
                            child: Text(
                              'Sign In',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 2.5,
                              ),
                            ),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  )),
                              print("Sign in button pressed")
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(28, 113, 160, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 64,
                top: 508,
                child: SizedBox(
                  width: 232,
                  height: 68,
                  child: Text(
                    'Get Started with TweetVibe, one of the most trusting sentiment analysis platform for you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
