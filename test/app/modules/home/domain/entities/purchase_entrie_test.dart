import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/purchase_entrie.dart';

main() {
  test('Should verify the fields', () {
    expect(
        PurchaseEntrie.newPucharse(offerId: '123-321', price: 0, balance: 0)
            .isValidOfferId,
        true);

    expect(
        PurchaseEntrie.newPucharse(offerId: null, price: 0, balance: 0)
            .isValidOfferId,
        false);

    expect(
        PurchaseEntrie.newPucharse(offerId: '', price: 0, balance: 0)
            .isValidOfferId,
        false);

    expect(
        PurchaseEntrie.newPucharse(offerId: '', price: 5000, balance: 5001)
            .hasBalance,
        true);

    expect(
        PurchaseEntrie.newPucharse(offerId: '', price: 5000, balance: 5000)
            .hasBalance,
        true);

    expect(
        PurchaseEntrie.newPucharse(offerId: '', price: 5000, balance: 4999.99)
            .hasBalance,
        false);
  });
}
