import 'package:flutter_test/flutter_test.dart';

main() {
  group('DefaultBottomNavBarWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      //await tester.pumpWidget(DefaultBottomNavBarWidget(title: 'T', controller: null,));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
