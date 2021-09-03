import 'package:dartz/dartz.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/customer_data_info.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/purchase_info.dart';
import 'package:nubank_marketplace/app/modules/home/domain/errors/errors.dart';

abstract class HomeRepository {
  Future<Either<Failure, CustomerDataInfo?>?>? getCustomerData();
  Future<Either<Failure, PurchaseInfo?>?>? newPurchase(
      {required dynamic offerId});
}
