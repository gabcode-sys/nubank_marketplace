import 'package:nubank_marketplace/app/modules/shop/presenter/pages/product_details/product_details_page.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('ProductDetailsPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(ProductDetailsPage(title: 'T'));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
