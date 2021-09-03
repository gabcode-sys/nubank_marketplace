import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_marketplace/app/modules/home/external/datasource/home_remote_datasource.dart';
import 'package:nubank_marketplace/app/modules/home/infra/models/customer_data_model.dart';
import 'package:nubank_marketplace/app/modules/home/infra/models/purchase_model.dart';

class HomeRemoteDatasourceMock extends Mock
    implements HomeRemoteDatasourceImpl {}

main() {
  final datasource = HomeRemoteDatasourceMock();

  var customers = CustomerDataModel(
      id: '123-321-123', name: 'Gabriel Nunes', balance: 100000);
  var purchase = PurchaseModel(
    success: true,
    customer: CustomerDataModel(
        id: '123-321', name: 'Gabriel Vieira Nunes', balance: 10000),
  );

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

  group('newPurchase |', () {
    test('Should return a PurchaseModel', () async {
      when(datasource.newPurchase(offerId: '123-321'))
          .thenAnswer((_) async => purchase);
      var result = await datasource.newPurchase(offerId: '123-321');
      expect(result, isA<PurchaseModel>());
    });
  });
}
