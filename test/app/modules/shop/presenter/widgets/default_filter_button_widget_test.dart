import 'package:nubank_marketplace/app/modules/shop/presenter/widgets/default_filter_button_widget.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('DefaultFilterButtonWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(DefaultFilterButtonWidget(
        title: 'T',
        onPressed: () {},
        visible: true,
      ));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
