import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_marketplace/app/modules/login/presenter/login/login_controller.dart';

void main() {
  late LoginController controller;

  setUpAll(() {
    controller = LoginController();
  });

  test('increment count', () async {
    expect(controller.value, equals(0));
    controller.increment();
    expect(controller.value, equals(1));
  });
}
