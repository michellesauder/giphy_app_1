import 'package:flutter/material.dart'; // Import Flutter material design package
import 'package:giphy_frontend/pages/login_screen.dart';

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
      home: LoginPage(), // Set the home page of the app
    );
  }
}
