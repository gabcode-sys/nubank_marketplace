import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_marketplace/app/modules/home/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/home/infra/drivers/connectivity_drivers.dart';
import 'package:nubank_marketplace/app/modules/home/infra/services/connectivity_service_impl.dart';

class ConnectivityDriverMock extends Mock implements ConnectivityDriver {}

main() {
  final driver = ConnectivityDriverMock();
  final service = ConnectivityServiceImpl(driver);

  group("ConnectivityServiceImpl", () {
    test('should return bool', () async {
      when(driver.isOnline).thenAnswer((_) async => true);
      var result = await service.isOnline();
      expect(result, isA<Right<dynamic, Unit>>());
    });
    test('should call ErrorLoginUser', () async {
      when(service.isOnline()).thenThrow(ConnectionError());
      var result = await service.isOnline();
      expect(result.leftMap((l) => l is ConnectionError), Left(true));
    });
  });
}
