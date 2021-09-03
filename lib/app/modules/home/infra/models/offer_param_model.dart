import 'package:nubank_marketplace/app/modules/home/domain/entities/offer_info.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/offer_param.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/offer_param_info.dart';

class OfferParamModel extends OfferParam implements OfferParamInfo {
  OfferParamModel({
    required double balance,
    required OfferInfo offer,
  }) : super(
          balance: balance,
          offer: offer,
        );

  OfferParam toOfferParam() => this;
}
