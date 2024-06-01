import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Graphs extends StatefulWidget {
  const Graphs({super.key});

  @override
  _GraphsState createState() =>
      _GraphsState();
}

class _GraphsState extends State<Graphs> {
  String sentimentResult = '';
  List<String> topHashtags = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the screen loads
  }

  Future<void> fetchData() async {
    final response = await http.get("http://127.0.0.1:5000/predict" as Uri);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        sentimentResult = data['sentiment'];
        topHashtags = List<String>.from(data['top_hashtags']);
      });
    } else {
      // If the server did not return a 200 OK response, show an error
      setState(() {
        sentimentResult = 'Error';
        topHashtags = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sentiment Analysis'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sentiment Result:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              sentimentResult,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Top Hashtags:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: topHashtags.map((hashtag) {
                return Text(
                  hashtag,
                  style: TextStyle(fontSize: 16),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
