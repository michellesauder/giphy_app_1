import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giphy_frontend/pages/giphy_home.dart';
import 'package:giphy_frontend/pages/login_screen.dart';
import 'package:integration_test/integration_test.dart';
import 'package:giphy_frontend/main.dart' as app;
import 'package:http/http.dart'
    as http; // Import HTTP package for making network requests

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end test', () {
    testWidgets('verify login screen with current username and password',
        (tester) async {
      app.main(); // calls the main app fn
      await tester.pumpAndSettle(); // make sure app is there
      await Future.delayed(const Duration(seconds: 2)); // wait for app to load

      await expectLater(find.byType(LoginPage),
          matchesGoldenFile('goldens/login_screen.png'));

      await tester.enterText(find.byType(TextFormField).at(0), 'username');
      await Future.delayed(const Duration(seconds: 2)); // wait for app to load

      await tester.enterText(find.byType(TextFormField).at(1), 'password');
      await Future.delayed(const Duration(seconds: 2)); // wait for app to load

      await tester.tap(find.byType(ElevatedButton));
      await Future.delayed(const Duration(seconds: 2)); // wait for app to load

      await tester.pumpAndSettle(); // make sure app is there

      expect(find.byType(GiphyHomePage), findsOneWidget);
      await Future.delayed(const Duration(seconds: 4)); // wait for app to load

      await expectLater(find.byType(GiphyHomePage),
          matchesGoldenFile('goldens/giphy_home_screen.png'));

      await tester.enterText(find.byType(TextField), 'dog');
      await tester.tap(find.byIcon(Icons.search));
      await Future.delayed(const Duration(seconds: 10));

      expect(find.text('No GIFs found'), findsNothing);
    });

    testWidgets('GiphyHome has a back button that navigates to LoginPage',
        (WidgetTester tester) async {
      // Build the GiphyHome widget
      await tester
          .pumpWidget(MaterialApp(home: GiphyHomePage(client: http.Client())));

      // Find the IconButton with the Icons.arrow_back icon
      final backButton = find.byIcon(Icons.arrow_back);

      // Verify the IconButton is present
      expect(backButton, findsOneWidget);

      // Tap the back button
      await tester.tap(backButton);

      // Rebuild the widget after the state has changed
      await tester.pumpAndSettle();

      // Verify the navigation to LoginPage
      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets(
        'verify incorrect login screen with current username and password',
        (tester) async {
      app.main(); // calls the main app function
      await tester.pumpAndSettle(); // make sure app is

      // Enter invalid credentials
      await tester.enterText(find.byType(TextFormField).at(0), 'Taylor Swift');
      await tester.enterText(find.byType(TextFormField).at(1), 'shake it off');

      // Tap the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle(); // Wait for the dialog to appear

      // Verify that the AlertDialog is displayed
      expect(find.byType(AlertDialog), findsOneWidget);

      // Verify the content of the AlertDialog
      expect(find.text('Invalid username or password'), findsOneWidget);
      expect(find.text('Error'), findsOneWidget); // Check the title if needed

      await expectLater(find.byType(AlertDialog),
          matchesGoldenFile('goldens/login_failed_screen.png'));

      // // Tap the OK button to close the dialog
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle(); // Wait for the dialog to close

      // // Optionally, you can check that the dialog is no longer present
      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
