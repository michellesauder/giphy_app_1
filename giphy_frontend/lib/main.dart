import 'package:flutter/material.dart'; // Import Flutter material design package
import 'package:giphy_frontend/pages/giphy_home_page.dart';
import 'package:http/http.dart'
    as http; // Import HTTP package for making network requests
import 'dart:convert'; // Import Dart's convert library for JSON encoding/decoding

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

// class GiphyHomePage extends StatefulWidget {
//   final http.Client client;

//   GiphyHomePage({Key? key, required this.client}) : super(key: key);

//   @override
//   _GiphyHomePageState createState() =>
//       _GiphyHomePageState(); // Create the state for GiphyHomePage
// }

// class _GiphyHomePageState extends State<GiphyHomePage> {
//   List<dynamic> gifs = []; // Initialize an empty list to hold GIFs
//   final TextEditingController _controller =
//       TextEditingController(); // Controller for the text field

//   // Function to GIFs based on the search query
//   Future<void> fetchGifs(String query) async {
//     final response = await widget.client
//         .get(Uri.parse('http://localhost:5000/api/gifs/search?query=$query'));

//     if (response.statusCode == 200) {
//       setState(() {
//         gifs = jsonDecode(response.body)['data'];
//       });
//     } else {
//       throw Exception('Failed to load GIFs');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Giphy App'), // Set the title of the app bar
//       ),
//       body: Column(
//         children: [
//           _buildSearchField(), // Build the search field
//           _buildGifGrid(), // Build the grid for displaying GIFs
//         ],
//       ),
//     );
//   }

//   // Widget to build the search field
//   Widget _buildSearchField() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0), // Add padding around the text field
//       child: TextField(
//         controller: _controller, // Assign the controller to the text field
//         decoration: InputDecoration(
//           labelText: 'Search GIFs', // Label for the field
//           suffixIcon: IconButton(
//             icon: const Icon(Icons.search), // Search icon
//             onPressed: () {
//               fetchGifs(_controller
//                   .text); // Fetch GIFs using the text in the controller
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   // Widget to build the grid for displaying GIFs
//   Widget _buildGifGrid() {
//     return Expanded(
//       child: gifs.isEmpty
//           ? const Center(
//               child:
//                   Text('No GIFs found')) // Show a message if no GIFs are found
//           : GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // Set the number of columns in the grid
//               ),
//               itemCount: gifs.length, // Set the number of items in the grid
//               itemBuilder: (context, index) {
//                 return Image.network(gifs[index]['images']['fixed_height'][
//                     'url']); // Build each grid item with an image from the GIFs list
//               },
//             ),
//     );
//   }
// }
