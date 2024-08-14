import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:giphy_frontend/pages/giphy_home_page.dart'; // Update with the correct path

// Create a Mock Client using Mockito
class MockClient extends Mock implements http.Client {}

@GenerateMocks([http.Client])
void main() {
  test('returns an giphs if the http call completes successfully', () async {
    final client = MockClient();
    Uri gifBackendUrl =
        Uri.parse('http://localhost:5000/api/gifs/search?query=dog');

    // Use Mockito to return a successful response when it calls the
    // provided http.Client.
    when(client.get(gifBackendUrl)).thenAnswer((_) async =>
        http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

    // expect(await fetchGifsFromApi(client, 'dog'), isA<List>());
  });

  // testWidgets('GiphyHomePage displays no GIFs message when empty',
  //     (WidgetTester tester) async {
  //   final client = MockClient();
  //   await tester.pumpWidget(MaterialApp(home: GiphyHomePage(client: client)));

  //   expect(find.text('No GIFs found'), findsOneWidget);
  // });

  // test('fetchGifs returns GIFs on success', () async {
  //   // Arrange
  //   final client = MockClient();
  //   final response = {
  //     'data': [
  //       {
  //         'images': {
  //           'fixed_height': {
  //             'url': 'https://example.com/gif1.gif',
  //           }
  //         }
  //       },
  //       {
  //         'images': {
  //           'fixed_height': {
  //             'url': 'https://example.com/gif2.gif',
  //           }
  //         }
  //       }
  //     ]
  //   };

  //   when(client
  //           .get(Uri.parse('http://localhost:5000/api/gifs/search?query=test')))
  //       .thenAnswer((_) async => http.Response(jsonEncode(response), 200));

  //   final page = GiphyHomePage(client: client);
  //   final state = page.createState();

  //   // Act
  //   await state.fetchGifs('test');

  //   // Assert
  //   expect(state.gifs.length, 2);
  //   expect(state.gifs[0]['images']['fixed_height']['url'],
  //       'https://example.com/gif1.gif');
  // });

//   test(
//       'GiphyHomePage displays "No GIFs found" when no GIFs are available',
//       (WidgetTester tester) async {
//     final client = MockClient();

//     when(client
//             .get(Uri.parse('http://localhost:5000/api/gifs/search?query=test')))
//         .thenAnswer((_) async => http.Response('{"data": []}', 200));

//     // Mock response for no GIFs found
// //     when(client
// //             .get(Uri.parse('http://localhost:5000/api/gifs/search?query=test')))
// //         .thenAnswer((_) async => http.Response('{"data": []}', 200));

// // // You can also simulate an error response for testing purposes
// //     when(client.get(
// //             Uri.parse('http://localhost:5000/api/gifs/search?query=error')))
// //         .thenAnswer((_) async => http.Response('{"error": "Not Found"}', 404));

//     // Use the mock client in the GiphyHomePage
//     await tester.pumpWidget(MaterialApp(home: GiphyHomePage(client: client)));

//     // Verify that the "No GIFs found" message is displayed
//     expect(find.text('No GIFs found'), findsOneWidget);
//   });

  // testWidgets('MyWidget', (WidgetTester tester) async {
  //   await tester.pumpWidget(const MyWidget());
  //   await tester.tap(find.text('Save'));
  //   expect(find.text('Success'), findsOneWidget);
  // });

  // testWidgets('GiphyHomePage fetches and displays GIFs',
  //     (WidgetTester tester) async {
  //   final client = MockClient();

  //   // Mock the HTTP response
  //   when(client
  //           .get(Uri.parse('http://localhost:5000/api/gifs/search?query=test')))
  //       .thenAnswer((_) async => http.Response(
  //           '{"data": [{"images": {"fixed_height": {"url": "http://example.com/gif1.gif"}}}]}',
  //           200));

  //   // Use the mock client in the GiphyPage
  //   await tester.pumpWidget(MaterialApp(home: GiphyHomePage(client: client)));

  //   // Simulate entering a search query
  //   final textField = find.byType(TextField);
  //   await tester.enterText(textField, 'test');
  //   await tester.tap(find.byIcon(Icons.search));
  //   await tester.pumpAndSettle(); // Wait for the fetchGifs to complete

  //   // Verify that the GIF is displayed
  //   expect(find.byType(Image), findsOneWidget);
  //   expect(find.byType(Image), findsOneWidget);
  // });

  // testWidgets('GiphyHomePage shows error message on failed fetch',
  //     (WidgetTester tester) async {
  //   final client = MockClient();

  //   // Mock the HTTP response to simulate an error
  //   when(client
  //           .get(Uri.parse('http://localhost:5000/api/gifs/search?query=test')))
  //       .thenAnswer((_) async => http.Response('Not Found', 404));

  //   await tester.pumpWidget(MaterialApp(home: GiphyHomePage()));

  //   // Simulate entering a search query
  //   final textField = find.byType(TextField);
  //   await tester.enterText(textField, 'test');
  //   await tester.tap(find.byIcon(Icons.search));
  //   await tester.pumpAndSettle(); // Wait for the fetchGifs to complete

  //   // Verify that the error message is displayed
  //   expect(find.text('No GIF found'), findsOneWidget);
  // });
}
