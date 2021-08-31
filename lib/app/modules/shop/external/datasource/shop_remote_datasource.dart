import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubank_marketplace/app/core/injection/register_module.dart';
import 'package:nubank_marketplace/app/core/utils/gql_query.dart';
import 'package:nubank_marketplace/app/modules/shop/infra/datasources/shop_datasource.dart';
import 'package:nubank_marketplace/app/modules/shop/infra/models/customer_data_model.dart';
import 'package:nubank_marketplace/app/modules/shop/infra/models/offer_model.dart';
import 'package:nubank_marketplace/app/modules/shop/infra/models/product_model.dart';

part 'shop_remote_datasource.g.dart';

@Injectable(singleton: false)
class ShopRemoteDatasourceImpl implements ShopDatasource {
  final RegisterModule registerModule;
  ShopRemoteDatasourceImpl(this.registerModule);

  @override
  Future<CustomerDataModel>? getCustomerData() async {
    List<OfferModel>? offers = [];
    late QueryResult result;
    result = await registerModule.gqlClient.query(QueryOptions(
      document: gql(GqlQuery.customerDataQuery),
      variables: {"id": "cccc3f48-dd2c-43ba-b8de-8945e7ababab"},
    ));

    // run through all offers
    List<dynamic> parser = result.data!["viewer"]["offers"];
    parser.forEach((element) {
      offers.add(
        OfferModel(
          id: element["id"],
          price: double.parse(element["price"].toString()),
          product: ProductModel(
            id: element["product"]["id"],
            name: element["product"]["name"],
            description: element["product"]["description"],
            image: element["product"]["image"],
          ),
        ),
      );
    });

    return CustomerDataModel(
      id: result.data!["viewer"]["id"],
      name: result.data!["viewer"]["name"],
      balance: double.parse(result.data!["viewer"]["balance"].toString()),
      offers: offers,
    );
  }
}
