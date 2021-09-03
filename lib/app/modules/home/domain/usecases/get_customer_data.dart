import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/customer_data_info.dart';
import 'package:nubank_marketplace/app/modules/home/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/home/domain/repositories/home_repository.dart';
import 'package:nubank_marketplace/app/modules/home/domain/services/connectivity_service.dart';

part 'get_customer_data.g.dart';

abstract class GetCustomerData {
  Future<Either<Failure, CustomerDataInfo?>?>? call();
}

@Injectable()
class GetCustomerDataImpl implements GetCustomerData {
  final HomeRepository homeRepository;
  final ConnectivityService connectivityService;

  GetCustomerDataImpl(this.homeRepository, this.connectivityService);

  @override
  Future<Either<Failure, CustomerDataInfo?>?>? call() async {
    var result = await connectivityService.isOnline();

    if (result!.isLeft()) {
      return result.map((r) => null);
    }

    return await homeRepository.getCustomerData();
  }
}
