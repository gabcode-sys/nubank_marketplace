import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_marketplace/app/modules/home/external/drivers/flutter_connectivity_driver_impl.dart';

class ConnectivityMock extends Mock implements Connectivity {}

main() {
  final connectivity = ConnectivityMock();
  final driver = FlutterConnectivityDriver(connectivity);
  test('should return bool mobile', () async {
    when(connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.mobile);

    expect(driver.isOnline, completion(true));
  }, skip: 'Null safety error');

  test('should return bool wifi', () async {
    when(connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.wifi);

    expect(driver.isOnline, completion(true));
  }, skip: 'Null safety error');

  test('should return bool false', () async {
    when(connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.none);

    expect(driver.isOnline, completion(false));
  }, skip: 'Null safety error');

  test('should return bool false', () async {
    when(connectivity.checkConnectivity()).thenThrow(Exception());

    expect(driver.isOnline, throwsA(isA<Exception>()));
  }, skip: 'Null safety error');
}
