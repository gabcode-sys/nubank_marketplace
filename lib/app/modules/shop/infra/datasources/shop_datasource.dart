import 'package:nubank_marketplace/app/modules/shop/domain/entities/purchase.dart';
import 'package:nubank_marketplace/app/modules/shop/infra/models/customer_data_model.dart';
import 'package:nubank_marketplace/app/modules/shop/infra/models/purchase_model.dart';

abstract class ShopDatasource {
  Future<CustomerDataModel>? getCustomerData();
  Future<PurchaseModel>? newPurchase({required dynamic offerId});
}
