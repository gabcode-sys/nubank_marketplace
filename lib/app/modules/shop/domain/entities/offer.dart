import 'package:equatable/equatable.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/product_info.dart';

class Offer extends Equatable {
  final dynamic id;
  final double price;
  final ProductInfo product;

  const Offer({
    required this.id,
    required this.price,
    required this.product,
  });

  @override
  List<Object?> get props => [
        id,
        price,
        product,
      ];
}
