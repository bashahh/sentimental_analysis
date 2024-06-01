
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Results extends StatelessWidget {
  TextEditingController _textController = TextEditingController();
  TextEditingController _resultController = TextEditingController();

  Future<void> _runAnalysis() async {
    String text = _textController.text;
    String url = 'http://127.0.0.1:5000/predict';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, String> body = {'text': text};
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String sentiment = data['sentiment'];
        _resultController.text = sentiment;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login.png'),
            fit: BoxFit.cover,
          ),
          color: Color(0xFFC1C1C1),
        ),
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              width: 27,
              height: 22,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.ibb.co/8KRYK6m/tweet-Vibeicon-png.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: Text(
                'Sentiment Analysis',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "Paste Tweet here",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.5,
                      color: const Color.fromARGB(255, 240, 236, 236),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 137,
              height: 33,
              child: ElevatedButton(
                onPressed: _runAnalysis,
                child: Text(
                  'Run Analysis',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(28, 113, 160, 1),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                controller: _resultController,
                decoration: InputDecoration(
                  hintText: 'Result',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
