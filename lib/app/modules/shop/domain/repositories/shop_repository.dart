import 'package:dartz/dartz.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/customer_data_info.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/errors/errors.dart';

abstract class ShopRepository {
  Future<Either<Failure, CustomerDataInfo?>?>? getCustomerData();
}
