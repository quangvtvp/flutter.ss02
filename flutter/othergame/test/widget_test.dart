// Lesson 2: Game Assets & Visual Elements
// Basic widget test for the demo app

import 'package:flutter_test/flutter_test.dart';

import 'package:lesson2_assets_demo/main.dart';

void main() {
  testWidgets('Game screen loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Lesson2AssetsDemo());

    // Verify that the lesson title is displayed
    expect(
      find.text('Lesson 2: Game Assets & Visual Elements'),
      findsOneWidget,
    );

    // Verify that sprite labels are displayed
    expect(find.text('Player'), findsOneWidget);
    expect(find.text('Enemy 1'), findsOneWidget);
    expect(find.text('Enemy 2'), findsOneWidget);
    expect(find.text('Coin'), findsOneWidget);
    expect(find.text('Gem'), findsOneWidget);
    expect(find.text('Star'), findsOneWidget);
  });
}
