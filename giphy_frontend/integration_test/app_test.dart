import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giphy_frontend/pages/giphy_home.dart';
import 'package:giphy_frontend/pages/login_screen.dart';
import 'package:integration_test/integration_test.dart';
import 'package:giphy_frontend/main.dart' as app;

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
      await Future.delayed(const Duration(seconds: 2)); // wait for app to load

      await expectLater(find.byType(GiphyHomePage),
          matchesGoldenFile('goldens/giphy_home_screen.png'));

      // await tester.enterText(find.byType(TextField), 'dog');
      // await tester.tap(find.byIcon(Icons.search));
      // await Future.delayed(const Duration(seconds: 10)); // wait for app to load

      // expect(find.text('No GIFs found'), findsNothing);
    });

    testWidgets('verify login screen with current username and password',
        (tester) async {
      app.main(); // calls the main app fn
      await tester.pumpAndSettle(); // make sure app is there
      await Future.delayed(const Duration(seconds: 2)); // wait for app to load
      await tester.enterText(find.byType(TextFormField).at(0), 'Taylor Swift');
      await Future.delayed(const Duration(seconds: 2)); // wait for app to load

      await tester.enterText(find.byType(TextFormField).at(1), 'shake it off');
      await Future.delayed(const Duration(seconds: 2)); // wait for app to load

      await tester.tap(find.byType(ElevatedButton));
      await Future.delayed(const Duration(seconds: 2)); // wait for app to load

      await tester.pumpAndSettle(); // make sure app is there

      await expectLater(find.byType(GiphyHomePage),
          matchesGoldenFile('goldens/login_failed_screen.png'));

      expect(find.text('Invalid username or password'), findsOneWidget);
    });
  });
}
