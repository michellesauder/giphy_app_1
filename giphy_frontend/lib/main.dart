import 'package:flutter/material.dart'; // Import Flutter material design package
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
      home: GiphyHomePage(), // Set the home page of the app
    );
  }
}

class GiphyHomePage extends StatefulWidget {
  @override
  _GiphyHomePageState createState() =>
      _GiphyHomePageState(); // Create the state for GiphyHomePage
}

class _GiphyHomePageState extends State<GiphyHomePage> {
  List<dynamic> gifs = []; // Initialize an empty list to hold GIFs
  final TextEditingController _controller =
      TextEditingController(); // Controller for the text field

  // Function to fetch GIFs based on the search query
  Future<void> fetchGifs(String query) async {
    // Make a GET request to the Giphy API with the search query
    final response = await http
        .get(Uri.parse('http://localhost:5000/api/gifs/search?query=$query'));

    // Check if the response status is OK (200)
    if (response.statusCode == 200) {
      setState(() {
        // Decode the JSON response and update the gifs list
        gifs = json.decode(response.body)['data'];
      });
    } else {
      // Throw an exception if the request failed
      throw Exception('Failed to load GIFs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giphy App'), // Set the title of the app bar
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.all(8.0), // Add padding around the text field
            child: TextField(
              controller:
                  _controller, // Assign the controller to the text field
              decoration: InputDecoration(
                labelText: 'Search GIFs', // Label for the text field
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search), // Search icon
                  onPressed: () {
                    // When the search icon is pressed, fetch GIFs using the text in the controller
                    fetchGifs(_controller.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: gifs.isEmpty // Check if the gifs list is empty
                ? const Center(
                    child: Text(
                        'No GIFs found')) // Show a message if no GIFs are found
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          2, // Set the number of columns in the grid
                    ),
                    itemCount:
                        gifs.length, // Set the number of items in the grid
                    itemBuilder: (context, index) {
                      // Build each grid item with an image from the GIFs list
                      return Image.network(
                          gifs[index]['images']['fixed_height']['url']);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
