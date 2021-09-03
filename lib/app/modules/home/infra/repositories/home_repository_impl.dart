import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/customer_data_info.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/purchase_info.dart';
import 'package:nubank_marketplace/app/modules/home/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/home/domain/repositories/home_repository.dart';
import 'package:nubank_marketplace/app/modules/home/infra/datasources/home_datasource.dart';

part 'home_repository_impl.g.dart';

@Injectable(singleton: false)
class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CustomerDataInfo?>?>? getCustomerData() async {
    try {
      var customerData = await dataSource.getCustomerData();
      return Right(customerData);
    } on Exception catch (e) {
      return Left(
        ErrorGetCustomerData(
          message:
              "An error has ocurred when trying get customer data, Details: $e",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, PurchaseInfo?>?>? newPurchase(
      {required offerId}) async {
    try {
      var purchase = await dataSource.newPurchase(offerId: offerId);
      return Right(purchase);
    } on Exception catch (e) {
      return Left(
        ErrorNewPurchase(
          message:
              "An error has ocurred when trying insert a new purchase, Details: $e",
        ),
      );
    }
  }
}
