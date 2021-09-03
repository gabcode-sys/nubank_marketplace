import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/customer_data_info.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/purchase_info.dart';
import 'package:nubank_marketplace/app/modules/home/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/home/infra/datasources/home_datasource.dart';
import 'package:nubank_marketplace/app/modules/home/infra/models/customer_data_model.dart';
import 'package:nubank_marketplace/app/modules/home/infra/models/purchase_model.dart';
import 'package:nubank_marketplace/app/modules/home/infra/repositories/home_repository_impl.dart';

class HomeDatasourceMock extends Mock implements HomeDatasource {}

main() {
  final datasource = HomeDatasourceMock();
  final repository = HomeRepositoryImpl(datasource);
  var response = CustomerDataModel(
      id: '123-321-123', name: 'Gabriel Vieira Nunes', balance: 1000);

  var purchase = PurchaseModel(
    success: true,
    customer: CustomerDataModel(
        id: '123-321', name: 'Gabriel Vieira Nunes', balance: 10000),
  );

  group('getCustomerData |', () {
    test('Should return a CustomerDataInfo', () async {
      when(datasource.getCustomerData()).thenAnswer((_) async => response);

      var result = await repository.getCustomerData();

      expect(result, isA<Right<dynamic, CustomerDataInfo?>>());
    });

    test('Should call ErrorGetCustomerData', () async {
      when(datasource.getCustomerData()).thenThrow(Exception());

      var result = await repository.getCustomerData();

      expect(result?.leftMap((l) => l is ErrorGetCustomerData), Left(true));
    });
  });

  group('newPurchase |', () {
    test('Should return a PurchaseInfo', () async {
      when(datasource.newPurchase(offerId: '123-321'))
          .thenAnswer((_) async => purchase);

      var result = await repository.newPurchase(offerId: '123-321');

      expect(result, isA<Right<dynamic, PurchaseInfo?>>());
    });

    test('Should call ErrorGetCustomerData', () async {
      when(datasource.newPurchase(offerId: 'offer/product'))
          .thenThrow(Exception());

      var result = await repository.newPurchase(offerId: 'offer/product');

      expect(result?.leftMap((l) => l is ErrorNewPurchase), Left(true));
    });
  });
}
