import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:gibt_app/views/countdown-page.dart';

void main() {
  testWidgets('CountdownPage test', (WidgetTester tester) async {
    // Pump the CountdownPage widget into the widget tester
    await tester.pumpWidget(MaterialApp(home: CountdownPage()));

    // Check if the initial counter value is correct
    expect(find.text('0:00:00'), findsOneWidget);

    // Check if pressing the minus button decreases the time
    await tester.tap(find.byIcon(Icons.exposure_minus_1));
    await tester.pump();
    expect(find.text('0:59:00'), findsOneWidget);

    // Check if pressing the plus button increases the time
    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.pump();
    expect(find.text('1:00:00'), findsOneWidget);

    // Check if pressing the Play/Pause button changes the animation state
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    expect(find.byIcon(Icons.pause), findsOneWidget);

    // Check if pressing the Stop button resets the counter
    await tester.tap(find.byIcon(Icons.stop));
    await tester.pump();
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
  });
}
