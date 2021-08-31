import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/customer_data_info.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/repositories/shop_repository.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/services/connectivity_service.dart';

part 'get_customer_data.g.dart';

abstract class GetCustomerData {
  Future<Either<Failure, CustomerDataInfo?>?>? call();
}

@Injectable()
class GetCustomerDataImpl implements GetCustomerData {
  final ShopRepository shopRepository;
  final ConnectivityService connectivityService;

  GetCustomerDataImpl(this.shopRepository, this.connectivityService);

  @override
  Future<Either<Failure, CustomerDataInfo?>?>? call() async {
    var result = await connectivityService.isOnline();

    if (result!.isLeft()) {
      return result.map((r) => null);
    }

    return await shopRepository.getCustomerData();
  }
}
