import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:esof_project/index.dart';
import 'package:esof_project/main.dart';

import 'package:esof_project/backend/firebase/firebase_config.dart';
import 'package:esof_project/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
  });

  testWidgets('Test Check Profile Widgets ', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'testuser@example.com', password: '123456');
    await tester.pumpWidget(MyApp(
      entryPage: ProfileWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('Image_j0xf')), findsOneWidget);
    expect(find.byKey(const ValueKey('Username_s9n4')), findsOneWidget);
    expect(find.byKey(const ValueKey('Email_4po9')), findsOneWidget);
    expect(find.byKey(const ValueKey('Row_6juz')), findsOneWidget);
    expect(find.byKey(const ValueKey('Row_xsyz')), findsOneWidget);
    expect(find.byKey(const ValueKey('Row_fz3j')), findsOneWidget);
    expect(find.byKey(const ValueKey('Row_lx11')), findsOneWidget);
    expect(find.byKey(const ValueKey('CarsRegistered_zi57')), findsOneWidget);
    expect(find.byKey(const ValueKey('ListView_d389')), findsOneWidget);
    expect(find.byKey(const ValueKey('NewCarPlate_28n2')), findsOneWidget);
    expect(find.byKey(const ValueKey('Button_a7gg')), findsOneWidget);
    expect(find.byKey(const ValueKey('Button_1ddl')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('Switch_en6p')));
    await tester.tap(find.byKey(const ValueKey('IconButton_o3ta')));
  });

  testWidgets('Test Check Notifications Widgets As User',
      (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'testuser@example.com', password: '123456');
    await tester.pumpWidget(MyApp(
      entryPage: NotificationsWidget(),
    ));
    await GoogleFonts.pendingFonts();

    expect(find.byKey(const ValueKey('ListView_8snq')), findsOneWidget);
    expect(find.byKey(const ValueKey('IconButton_gv90')), findsNothing);
  });

  testWidgets('Test Check Notifications WIdgets As Security',
      (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'testsec@example.com', password: '123456');
    await tester.pumpWidget(MyApp(
      entryPage: NotificationsWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('ListView_8snq')), findsOneWidget);
    expect(find.byKey(const ValueKey('IconButton_gv90')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('IconButton_gv90')));
    await tester.pumpAndSettle();
    expect(find.text('CarPlate'), findsOneWidget);
    expect(find.text('Message'), findsOneWidget);
    expect(find.text('Send'), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
