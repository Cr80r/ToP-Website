import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zaylo/main.dart';
import 'package:zaylo/repositories/providers.dart';

Widget app({bool onboarded = true, bool signedIn = true}) => ProviderScope(overrides: [onboardingCompleteProvider.overrideWith((ref) => StateController(onboarded)), authProvider.overrideWith((ref) => AuthController()..signIn())], child: const ZayloApp());

void main() {
  testWidgets('App launch shows home for signed-in user', (tester) async { await tester.pumpWidget(app()); await tester.pumpAndSettle(); expect(find.text('Good morning, Shammah'), findsOneWidget); });
  testWidgets('Bottom navigation opens Explore', (tester) async { await tester.pumpWidget(app()); await tester.pumpAndSettle(); await tester.tap(find.text('Explore')); await tester.pumpAndSettle(); expect(find.text('Money'), findsOneWidget); });
  testWidgets('Login form validation shows errors', (tester) async { await tester.pumpWidget(ProviderScope(overrides:[onboardingCompleteProvider.overrideWith((ref)=>StateController(true))], child: const ZayloApp())); await tester.pumpAndSettle(); await tester.tap(find.text('Sign in')); await tester.pumpAndSettle(); await tester.tap(find.byKey(const Key('signInButton'))); await tester.pump(); expect(find.text('Enter a valid email'), findsOneWidget); expect(find.text('Password must be at least 6 characters'), findsOneWidget); });
  testWidgets('Adding an expense updates the list', (tester) async { await tester.pumpWidget(app()); await tester.pumpAndSettle(); await tester.tap(find.text('Expenses')); await tester.pumpAndSettle(); await tester.tap(find.byKey(const Key('addExpenseFab'))); await tester.pumpAndSettle(); await tester.enterText(find.byKey(const Key('expenseTitleField')), 'Airtime'); await tester.enterText(find.byKey(const Key('expenseAmountField')), '5'); await tester.tap(find.byKey(const Key('saveExpenseButton'))); await tester.pumpAndSettle(); expect(find.text('Airtime'), findsOneWidget); });
  testWidgets('Opening a feature page shows grocery prices', (tester) async { await tester.pumpWidget(app()); await tester.pumpAndSettle(); await tester.tap(find.text('Prices')); await tester.pumpAndSettle(); expect(find.text('Grocery Prices'), findsOneWidget); });
}
