import 'package:application/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:application/main.dart' as app;

void main() {
  group('integration_test1', () {

    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("test1", (tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 5));
      final loginButton1 = find.byKey(Key("loginButton1"));
      expect(tester.any(loginButton1) , true);
      await tester.tap(loginButton1);
      await tester.pumpAndSettle();
      await tester.pumpWidget(MySplashScreen() , Duration(seconds: 5));
      expect(find.byType(Material), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });
}
