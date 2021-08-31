import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_marketplace/app/modules/shop/external/datasource/shop_remote_datasource.dart';
import 'package:nubank_marketplace/app/modules/shop/infra/models/customer_data_model.dart';

class ShopRemoteDatasourceMock extends Mock
    implements ShopRemoteDatasourceImpl {}

main() {
  final datasource = ShopRemoteDatasourceMock();
  var customers = CustomerDataModel(
      id: '123-321-123', name: 'Gabriel Nunes', balance: 100000);

  group('getCustomerData |', () {
    test('Should return a CustomerDataModel', () async {
      when(datasource.getCustomerData()).thenAnswer((_) async => customers);
      var result = await datasource.getCustomerData();
      expect(result, isA<CustomerDataModel>());
    });

    test('Should return a Exception', () async {
      when(datasource.getCustomerData()).thenThrow(Exception());

      expect(() => datasource.getCustomerData(), throwsA(isA<Exception>()));
    });
  });
}
