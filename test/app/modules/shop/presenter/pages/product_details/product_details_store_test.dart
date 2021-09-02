import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_marketplace/app/modules/shop/presenter/pages/product_details/product_details_controller.dart';

void main() {
  late ProductDetailsStore store;

  setUpAll(() {
    store = ProductDetailsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
