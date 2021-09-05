import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_marketplace/app/modules/home/external/drivers/flutter_connectivity_driver_impl.dart';
import 'flutter_connectivity_driver_test.mocks.dart';

//More informations about @GenerateMocks annoation see https://github.com/dart-lang/mockito/blob/master/NULL_SAFETY_README.md
@GenerateMocks([Connectivity])
main() {
  final connectivity = MockConnectivity();
  final driver = FlutterConnectivityDriver(connectivity);
  test('should return bool mobile', () async {
    when(connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.mobile);

    expect(driver.isOnline, completion(true));
  });

  test('should return bool wifi', () async {
    when(connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.wifi);

    expect(driver.isOnline, completion(true));
  });

  test('should return bool false', () async {
    when(connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.none);

    expect(driver.isOnline, completion(false));
  });

  test('should return bool false', () async {
    when(connectivity.checkConnectivity()).thenThrow(Exception());

    expect(driver.isOnline, throwsA(isA<Exception>()));
  });
}
