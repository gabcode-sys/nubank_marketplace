import 'package:nubank_marketplace/app/modules/home/infra/models/customer_data_model.dart';
import 'package:nubank_marketplace/app/modules/home/infra/models/purchase_model.dart';

abstract class HomeDatasource {
  Future<CustomerDataModel>? getCustomerData();
  Future<PurchaseModel>? newPurchase({required dynamic offerId});
}
