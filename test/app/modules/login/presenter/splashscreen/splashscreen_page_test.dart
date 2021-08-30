import 'package:nubank_marketplace/app/modules/login/presenter/splashscreen/splashscreen_page.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('LoginPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(SplashscreenPage());
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
