import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gibt_app/views/achievement-page.dart';
import 'package:gibt_app/views/profile-page.dart';
import 'package:gibt_app/views/settings-page.dart';
import 'package:gibt_app/views/store-page.dart';
import 'package:gibt_app/widgets/side-menu.dart';

void main() {
  testWidgets('SideMenu navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SideMenu()));

    // Verify that the initial screen is the ProfileScreen
    expect(find.byType(ProfileScreen), findsOneWidget);
    expect(find.byType(StoreScreen), findsNothing);
    expect(find.byType(AchievementsScreen), findsNothing);
    expect(find.byType(SettingsScreen), findsNothing);

    // Tap on the Store menu item
    await tester.tap(find.text('Store'));
    await tester.pumpAndSettle();

    // Verify that the StoreScreen is displayed
    expect(find.byType(ProfileScreen), findsNothing);
    expect(find.byType(StoreScreen), findsOneWidget);
    expect(find.byType(AchievementsScreen), findsNothing);
    expect(find.byType(SettingsScreen), findsNothing);

    // Tap on the Achievements menu item
    await tester.tap(find.text('Achievements'));
    await tester.pumpAndSettle();

    // Verify that the AchievementsScreen is displayed
    expect(find.byType(ProfileScreen), findsNothing);
    expect(find.byType(StoreScreen), findsNothing);
    expect(find.byType(AchievementsScreen), findsOneWidget);
    expect(find.byType(SettingsScreen), findsNothing);

    // Tap on the Settings menu item
    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    // Verify that the SettingsScreen is displayed
    expect(find.byType(ProfileScreen), findsNothing);
    expect(find.byType(StoreScreen), findsNothing);
    expect(find.byType(AchievementsScreen), findsNothing);
    expect(find.byType(SettingsScreen), findsOneWidget);
  });
}
