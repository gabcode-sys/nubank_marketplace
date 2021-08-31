import 'package:dartz/dartz.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/errors/errors.dart';

abstract class ConnectivityService {
  Future<Either<Failure, Unit>>? isOnline();
}
