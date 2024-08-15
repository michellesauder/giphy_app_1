import 'package:flutter/material.dart'; // Import Flutter material design package
import 'package:http/http.dart'
    as http; // Import HTTP package for making network requests

import 'pages/giphy_home.dart';

void main() {
  runApp(MyApp()); // Run the MyApp widget as the root of the application
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giphy App', // Set the title of the app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define the primary color theme
      ),
      home: GiphyHomePage(
        client: http.Client(),
      ), // Set the home page of the app
    );
  }
}
