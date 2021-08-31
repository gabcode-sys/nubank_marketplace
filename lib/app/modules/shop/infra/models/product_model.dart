import 'package:nubank_marketplace/app/modules/shop/domain/entities/customer_data.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/customer_data_info.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/product.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/product_info.dart';

class ProductModel extends Product implements ProductInfo {
  ProductModel({
    required dynamic id,
    required String name,
    String? description,
    String? image,
  }) : super(
          id: id,
          name: name,
          description: description,
          image: image,
        );

  Product toProduct() => this;
}
