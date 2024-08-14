import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giphy_frontend/pages/giphy_home.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('GiphyHomePage', () {
    testWidgets('initial state displays no GIFs message',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: GiphyHomePage()));

      // Check if the app bar title is correct
      expect(find.text('Giphy App'), findsOneWidget);
      // Check if the search field is present
      expect(find.byType(TextField),
          findsOneWidget); // Check if the no GIFs message is displayed
      expect(find.text('No GIFs found'), findsOneWidget);
    });
  });

  




}