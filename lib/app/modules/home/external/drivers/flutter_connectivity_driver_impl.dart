import 'package:nubank_marketplace/app/modules/home/infra/drivers/connectivity_drivers.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'flutter_connectivity_driver_impl.g.dart';

@Injectable(singleton: false)
class FlutterConnectivityDriver implements ConnectivityDriver {
  final Connectivity connectivity;

  FlutterConnectivityDriver(this.connectivity);

  @override
  Future<bool> get isOnline async {
    var result = await connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile;
  }
}
