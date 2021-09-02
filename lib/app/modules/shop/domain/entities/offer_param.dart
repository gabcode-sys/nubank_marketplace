import 'package:equatable/equatable.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/customer_data_info.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/offer_info.dart';

class OfferParam extends Equatable {
  final double balance;
  final OfferInfo offer;

  const OfferParam({
    required this.balance,
    required this.offer,
  });

  @override
  List<Object?> get props => [
        balance,
        offer,
      ];
}
