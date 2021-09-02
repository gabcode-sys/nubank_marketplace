import 'package:equatable/equatable.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/customer_data_info.dart';

class Purchase extends Equatable {
  final bool success;
  final String? errorMessage;
  final CustomerDataInfo customer;

  const Purchase({
    required this.success,
    this.errorMessage,
    required this.customer,
  });

  @override
  List<Object?> get props => [
        success,
        errorMessage,
        customer,
      ];
}
