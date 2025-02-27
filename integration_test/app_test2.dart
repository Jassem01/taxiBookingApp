import 'package:application/ClientApp/splash_screen/splash_screen_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:application/main.dart' as app;

void main() {
  group('integration_test2', () {

    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("test2", (tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 5));
      final loginButton2 = find.byKey(Key("loginButton2"));
      expect(tester.any(loginButton2) , true);
      await tester.tap(loginButton2);
      await tester.pumpAndSettle();
      await tester.pumpWidget(MySplashScreen2() , Duration(seconds: 5));
      expect(find.byType(Material), findsOneWidget);
      await tester.pumpAndSettle();

    });
  });
}
