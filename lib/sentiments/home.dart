import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Result.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0; // Index of the currently selected tab

  // List of pages to be displayed in each tab
  final List<Widget> _pages = [
    HomeScreen(),
    Details(),
    // Profile(),
  ];

  // Function to handle tap on bottom navigation items
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Updating the selected tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Removed AppBar
      body: _pages[_currentIndex], // Displaying the current tab page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red, // Setting background color to transparent
        currentIndex: _currentIndex, // Setting the selected index
        onTap: _onItemTapped, // Handling tap event
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  Future<void> _submitText(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/predict'), // Server address
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'text': _textEditingController.text,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final sentiment = data['sentiment'];
        // Navigate to results screen with the sentiment
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Results(sentiment: sentiment);
            },
          ),
        );
      } else {
        // Handle error
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login.png'),
            fit: BoxFit.cover,
          ),
          color: Color(0xFFC1C1C1),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 18,
              top: 141,
              child: Container(
                width: 323,
                height: 46,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 323,
                        height: 46,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF3FCF0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: TextFormField(
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                            hintText: '  Paste URL',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 284,
                      top: 15,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://i.ibb.co/Vp0cRBq/icons8-attachment-25.png"
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 112,
              top: 213,
              child: Container(
                width: 137,
                height: 33,
                child: ElevatedButton(
                  child: Text(
                    'Collect Data',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 2.5,
                    ),
                  ),
                  onPressed: () => _submitText(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(28, 113, 160, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Text('Details Page'),
      ),
    );
  }
}


class Results extends StatelessWidget {
  final String sentiment;

  const Results({Key? key, required this.sentiment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: Text('Sentiment: $sentiment'),
      ),
    );
  }
}








