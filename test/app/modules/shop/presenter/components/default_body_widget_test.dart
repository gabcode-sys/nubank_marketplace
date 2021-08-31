import 'package:flutter_test/flutter_test.dart';

main() {
  group('DefaultBodyWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      //await tester.pumpWidget(DefaultBodyWidget(title: 'T', controller: null,));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
