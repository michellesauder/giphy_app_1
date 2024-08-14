import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:mockito/mockito.dart';

import 'fetch_giphy_test.mocks.dart';
import 'package:giphy_frontend/pages/giphy_home.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  late MockClient client;
  group('GiphyHomePage', () {
    setUp(() {
      client = MockClient(); // Initialize the MockClient before each test
    });
    testWidgets('initial state displays no GIFs message',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: GiphyHomePage(
        client: http.Client(),
      )));

      // Check if the app bar title is correct
      expect(find.text('Giphy App'), findsOneWidget);
      // Check if the search field is present
      expect(find.byType(TextField),
          findsOneWidget); // Check if the no GIFs message is displayed
      expect(find.text('No GIFs found'), findsOneWidget);
    });

    test('returns an giphs if the http call completes successfully', () async {
      client = MockClient();
      Uri gifBackendUrl =
          Uri.parse('http://localhost:5000/api/gifs/search?query=dog');

      var contents = await File(p.join(Directory.current.path, 'test',
              'test_data_query_response_dog.txt'))
          .readAsString();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(gifBackendUrl))
          .thenAnswer((_) async => http.Response(contents, 200));

      expect(await fetchGifsFromApi(client, 'dog'), isA<List>());
    });
  });
}
