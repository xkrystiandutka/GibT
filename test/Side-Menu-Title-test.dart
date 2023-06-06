import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gibt_app/models/rive-asset.dart';
import 'package:gibt_app/models/user.dart';

import 'package:gibt_app/widgets/side-menu-title.dart';

void main() {
  testWidgets('SideMenuTitle Widget Test', (WidgetTester tester) async {
    // Prepare test data
    final RiveAsset testMenu = RiveAsset(
      'test_src',
      artboard: 'test_artboard',
      title: 'Test Title',
      stateMachineName: '',
    );
    bool pressed = false;
    bool riveInitialized = false;
    bool isActive = true;
    final User testUser = User(
      profileName: 'Krystian Kasparov',
      profileEmail: 'Kasparov2137@example.com',
      profilePhoto: 'assets/images/profile.png',
      balance: User.initBalance,
      profileLevel: 1,
      themeColor: Colors.red,
      themeSecondaryColor: Colors.blue,
    );

    // Check if the widget is rendered correctly
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);

    // Trigger onTap method
    await tester.tap(find.byType(ListTile));
    expect(pressed, true);

    // Check Rive initialization
    expect(riveInitialized, true);

    // Check container appearance
    final containerFinder = find.descendant(
      of: find.byType(Stack),
      matching: find.byType(Container),
    );
    expect(containerFinder, findsOneWidget);
    final container = tester.widget<Container>(containerFinder);

    final boxDecoration = container.decoration as BoxDecoration;
    expect(boxDecoration.color, testUser.themeSecondaryColor);
    expect(
      boxDecoration.borderRadius,
      const BorderRadius.all(Radius.circular(10)),
    );
  });
}
