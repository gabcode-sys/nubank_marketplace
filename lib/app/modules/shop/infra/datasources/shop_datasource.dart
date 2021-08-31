import 'package:nubank_marketplace/app/modules/shop/infra/models/customer_data_model.dart';

abstract class ShopDatasource {
  Future<CustomerDataModel>? getCustomerData();
}
