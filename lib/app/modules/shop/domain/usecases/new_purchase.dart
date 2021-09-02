import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/purchase_entrie.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/purchase_info.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/repositories/shop_repository.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/services/connectivity_service.dart';

part 'new_purchase.g.dart';

abstract class NewPurchase {
  Future<Either<Failure, PurchaseInfo?>?>? call(PurchaseEntrie purchase);
}

@Injectable()
class NewPurchaseImpl implements NewPurchase {
  final ShopRepository shopRepository;
  final ConnectivityService connectivityService;

  NewPurchaseImpl(this.shopRepository, this.connectivityService);

  @override
  Future<Either<Failure, PurchaseInfo?>?>? call(PurchaseEntrie purchase) async {
    var result = await connectivityService.isOnline();

    if (result!.isLeft()) {
      return result.map((r) => null);
    }

    if (!purchase.isValidOfferId) {
      return Left(
        NotValidEntrie(message: 'It is necessary to select an offer'),
      );
    } else if (!purchase.hasBalance) {
      return Left(
        NoBalance(message: 'There is not enough balance for this purchase'),
      );
    }

    return await shopRepository.newPurchase(offerId: purchase.offerId);
  }
}
