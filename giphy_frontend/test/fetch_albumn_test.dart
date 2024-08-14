// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'fetch_albumn_test.mocks.dart';
// import 'giphy_home_page_test.dart'; // Import the generated mock file

// class MockClient extends Mock implements http.Client {}

// // Generate the mock class for http.Client
// @GenerateMocks([http.Client])
// void main() {
//   group('fetchAlbum', () {
//     test('returns Album if the http call completes successfully', () async {
//       // Create an instance of the mock client
//       final client = MockClient();

//       // Use Mockito to return a successful response when it calls the provided http.Client.
//       when(client
//               .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
//           .thenAnswer((_) async =>
//               http.Response('{"id": 1, "title": "Test Album"}', 200));

//       // Your test logic here
//       final response = await client
//           .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
//       expect(response.statusCode, 200);
//       expect(response.body, '{"id": 1, "title": "Test Album"}');
//     });
//   });
// }
