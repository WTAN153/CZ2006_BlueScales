import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:blue_scale/controller/login_controller.dart';
import 'package:blue_scale/screen/auth/login_main.dart';
import '../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Login with wrong email", (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();
    final emailFormField = find.byType(TextField).first;
    final passwordFormField = find.byType(TextField).last;
    final loginButton = find.byType(MaterialButton).first;

    await tester.tap(emailFormField);
    await tester.enterText(emailFormField, 'dummy123@gmail.com');
    await tester.tap(passwordFormField);
    await tester.enterText(passwordFormField, 'dummy123');
    await tester.pumpAndSettle();

    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    expect(
        find.text(
            'The password is invalid or the user does not have a password.'),
        findsNothing);
  });

  testWidgets("Login with wrong password", (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();
    final emailFormField = find.byType(TextField).first;
    final passwordFormField = find.byType(TextField).last;
    final loginButton = find.byType(MaterialButton).first;

    await tester.tap(emailFormField);
    await tester.enterText(emailFormField, 'dummy@gmail.com');
    await tester.tap(passwordFormField);
    await tester.enterText(passwordFormField, 'dummy123!');
    await tester.pumpAndSettle();

    await tester.tap(loginButton);
    expect(
        find.text(
            'The password is invalid or the user does not have a password.'),
        findsNothing);
  });

  testWidgets("Login successfully", (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();
    final emailFormField = find.byType(TextField).first;
    final passwordFormField = find.byType(TextField).last;
    final loginButton = find.byType(MaterialButton).first;

    await tester.tap(emailFormField);
    await tester.enterText(emailFormField, 'dummy@gmail.com');
    await tester.tap(passwordFormField);
    await tester.enterText(passwordFormField, 'dummy123');
    await tester.pumpAndSettle();

    await tester.tap(loginButton);
    expect(find.text('Login Successfully'), findsNothing);
  });
}
