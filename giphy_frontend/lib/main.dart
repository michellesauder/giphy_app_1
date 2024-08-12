import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giphy App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GiphyHomePage(),
    );
  }
}

class GiphyHomePage extends StatefulWidget {
  @override
  _GiphyHomePageState createState() => _GiphyHomePageState();
}

class _GiphyHomePageState extends State<GiphyHomePage> {
  List<dynamic> gifs = [];
  final TextEditingController _controller = TextEditingController();

  Future<void> fetchGifs(String query) async {
    final response = await http
        .get(Uri.parse('http://localhost:5000/api/gifs/search?query=$query'));
    if (response.statusCode == 200) {
      setState(() {
        gifs = json.decode(response.body)['data'];
      });
    } else {
      throw Exception('Failed to load GIFs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giphy App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search GIFs',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    fetchGifs(_controller.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: gifs.isEmpty
                ? const Center(child: Text('No GIFs found'))
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: gifs.length,
                    itemBuilder: (context, index) {
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
