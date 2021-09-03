import 'package:nubank_marketplace/app/modules/home/domain/entities/customer_data.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/customer_data_info.dart';

import 'offer_model.dart';

class CustomerDataModel extends CustomerData implements CustomerDataInfo {
  CustomerDataModel({
    required dynamic id,
    required String name,
    required double balance,
    List<OfferModel>? offers,
  }) : super(
          id: id,
          name: name,
          balance: balance,
          offers: offers,
        );

  CustomerData toCustomerData() => this;
}
