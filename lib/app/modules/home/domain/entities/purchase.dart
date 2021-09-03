import 'package:equatable/equatable.dart';

import 'customer_data_info.dart';

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
