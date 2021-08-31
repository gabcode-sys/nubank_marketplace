import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/customer_data_info.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/repositories/shop_repository.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/services/connectivity_service.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/usecases/get_customer_data.dart';
import 'package:nubank_marketplace/app/modules/shop/infra/models/customer_data_model.dart';

class ShopRepositoryMock extends Mock implements ShopRepository {}

class ConnectivityServiceMock extends Mock implements ConnectivityService {}

main() {
  var repository = ShopRepositoryMock();
  var service = ConnectivityServiceMock();
  var usecase = GetCustomerDataImpl(repository, service);
  var customerDataReturn = CustomerDataModel(
    id: '123-321-123-312',
    name: 'Gabriel Nunes',
    balance: 10000,
  );
  setUpAll(() async {
    when(service.isOnline()).thenAnswer((_) async => Right(unit));
  });

  test('Should return a CustomerDataInfo', () async {
    when(repository.getCustomerData())
        .thenAnswer((_) async => Right(customerDataReturn));

    var result = (await usecase())?.fold((l) => null, (r) => r);
    expect(result, isA<CustomerDataInfo>());
  });

  test('Should return ConnectionError when connection is not online', () async {
    when(service.isOnline()).thenAnswer((_) async => Left(ConnectionError()));
    var result = await usecase();
    expect(result?.leftMap((l) => l is ConnectionError), Left(true));
  });
}
