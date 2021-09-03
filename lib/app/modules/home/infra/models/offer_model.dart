import 'package:nubank_marketplace/app/modules/home/domain/entities/offer.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/offer_info.dart';
import 'package:nubank_marketplace/app/modules/home/infra/models/product_model.dart';

class OfferModel extends Offer implements OfferInfo {
  OfferModel({
    required dynamic id,
    required double price,
    required ProductModel product,
  }) : super(
          id: id,
          price: price,
          product: product,
        );

  OfferModel toOffer() => this;
}
