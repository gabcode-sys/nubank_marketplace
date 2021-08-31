import 'package:flutter_test/flutter_test.dart';

main() {
  group('ShopAppBarWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      //await tester.pumpWidget(DefaultAppBar(controller: null,));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
