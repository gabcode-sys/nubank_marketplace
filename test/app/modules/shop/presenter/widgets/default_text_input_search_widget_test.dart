import 'package:nubank_marketplace/app/modules/shop/presenter/widgets/default_title.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('DefaultTextInputSearchWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget((DefaultTitle(
        visible: false,
      )));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
