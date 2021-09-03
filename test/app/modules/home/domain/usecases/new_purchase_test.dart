import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/purchase_entrie.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/purchase_info.dart';
import 'package:nubank_marketplace/app/modules/home/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/home/domain/repositories/home_repository.dart';
import 'package:nubank_marketplace/app/modules/home/domain/services/connectivity_service.dart';
import 'package:nubank_marketplace/app/modules/home/domain/usecases/new_purchase.dart';
import 'package:nubank_marketplace/app/modules/home/infra/models/customer_data_model.dart';
import 'package:nubank_marketplace/app/modules/home/infra/models/purchase_model.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

class ConnectivityServiceMock extends Mock implements ConnectivityService {}

main() {
  var repository = HomeRepositoryMock();
  var service = ConnectivityServiceMock();
  var usecase = NewPurchaseImpl(repository, service);

  var purchaseReturn = PurchaseModel(
    success: true,
    errorMessage: null,
    customer: CustomerDataModel(
      id: '123-321-123',
      name: 'Gabriel Vieira Nunes',
      balance: 100000,
    ),
  );

  setUpAll(() async {
    when(service.isOnline()).thenAnswer((_) async => Right(unit));
  });

  test('Should return a PurchaseInfo', () async {
    when(repository.newPurchase(offerId: 'offer/product-sample'))
        .thenAnswer((_) async => Right(purchaseReturn));

    var result = (await usecase(PurchaseEntrie.newPucharse(
            offerId: 'offer/product-sample', price: 5000, balance: 5000)))
        ?.fold((l) => null, (r) => r);
    expect(result, isA<PurchaseInfo>());
  });

  test('Should call NotValidEntrie', () async {
    var result = await usecase(
        PurchaseEntrie.newPucharse(offerId: null, price: 5000, balance: 10000));

    expect(result?.leftMap((l) => l is NotValidEntrie), Left(true));
  });

  test('Should call NoBalance', () async {
    var result = await usecase(PurchaseEntrie.newPucharse(
        offerId: '123-321', price: 5000, balance: 4999));

    expect(result?.leftMap((l) => l is NoBalance), Left(true));
  });

  test('Should return ConnectionError when connection is not online', () async {
    when(service.isOnline()).thenAnswer((_) async => Left(ConnectionError()));
    var result = await usecase(PurchaseEntrie.newPucharse(
        offerId: 'offer/product-sample', price: 5000, balance: 10000));
    expect(result?.leftMap((l) => l is ConnectionError), Left(true));
  });
}
