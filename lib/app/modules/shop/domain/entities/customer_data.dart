import 'package:equatable/equatable.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/offer_info.dart';

class CustomerData extends Equatable {
  final dynamic id;
  final String name;
  final double balance;
  final List<OfferInfo>? offers;

  const CustomerData({
    required this.id,
    required this.name,
    required this.balance,
    this.offers,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        balance,
        offers,
      ];
}
