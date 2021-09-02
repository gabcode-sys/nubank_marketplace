import 'package:nubank_marketplace/app/modules/shop/domain/entities/customer_data_info.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/purchase.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/purchase_info.dart';

class PurchaseModel extends Purchase implements PurchaseInfo {
  PurchaseModel({
    required bool success,
    String? errorMessage,
    required CustomerDataInfo customer,
  }) : super(
          success: success,
          errorMessage: errorMessage,
          customer: customer,
        );

  Purchase toPurchase() => this;
}
