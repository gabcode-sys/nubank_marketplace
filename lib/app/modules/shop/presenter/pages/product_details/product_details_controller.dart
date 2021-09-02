import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/offer_param_info.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/purchase_entrie.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/purchase_info.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/usecases/new_purchase.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

part 'product_details_controller.g.dart';

@Injectable()
class ProductDetailsController = ProductDetailsControllerBase
    with _$ProductDetailsController;

abstract class ProductDetailsControllerBase with Store {
  final OfferParamInfo? offerParamInfo;
  final NewPurchase newPurchaseUseCase;
  ProductDetailsControllerBase(
    this.newPurchaseUseCase, {
    @Data this.offerParamInfo,
  });

  @observable
  NumberFormat numberFormat = NumberFormat("#,##0.00", "pt_BR");

  @observable
  PanelController panelController = new PanelController();

  @computed
  PurchaseEntrie get purchaseEntrie => PurchaseEntrie.newPucharse(
        offerId: this.offerParamInfo?.offer.id,
        price: this.offerParamInfo?.offer.price,
        balance: this.offerParamInfo?.balance,
      );

  @computed
  bool get isValidPurchaseEntrie => purchaseEntrie.isValidOfferId;

  @action
  Future<dynamic> newPurchase() async {
    if (this.isValidPurchaseEntrie) {
      var result = await newPurchaseUseCase(
        PurchaseEntrie.newPucharse(
          offerId: this.purchaseEntrie.offerId,
          price: this.purchaseEntrie.price,
          balance: this.purchaseEntrie.balance,
        ),
      );
      return result!.fold((l) {
        return l;
      }, (PurchaseInfo? r) {
        Modular.to.pop(r);
      });
    } else {
      //
    }
  }
}
