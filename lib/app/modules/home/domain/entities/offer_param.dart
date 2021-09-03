import 'package:equatable/equatable.dart';

import 'offer_info.dart';

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
