import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/home/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/home/domain/services/connectivity_service.dart';
import 'package:nubank_marketplace/app/modules/home/infra/drivers/connectivity_drivers.dart';

part 'connectivity_service_impl.g.dart';

@Injectable(singleton: false)
class ConnectivityServiceImpl implements ConnectivityService {
  final ConnectivityDriver connectivityDriver;
  ConnectivityServiceImpl(this.connectivityDriver);

  @override
  Future<Either<Failure, Unit>> isOnline() async {
    try {
      var check = await connectivityDriver.isOnline;
      if (check) {
        return Right(unit);
      }
      throw ConnectionError(message: 'Você está offline');
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ConnectionError(message: 'Erro ao Recuperar Informação de Conexão'),
      );
    }
  }
}
