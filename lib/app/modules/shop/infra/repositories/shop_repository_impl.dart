import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/entities/customer_data_info.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/repositories/shop_repository.dart';
import 'package:nubank_marketplace/app/modules/shop/infra/datasources/shop_datasource.dart';

part 'shop_repository_impl.g.dart';

@Injectable(singleton: false)
class ShopRepositoryImpl implements ShopRepository {
  final ShopDatasource dataSource;

  ShopRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CustomerDataInfo?>?>? getCustomerData() async {
    try {
      var customerData = await dataSource.getCustomerData();
      return Right(customerData);
    } on Exception catch (e) {
      return Left(
        ErrorGetCustomerData(
          message: "An error has ocurred when trying get customer data",
        ),
      );
    }
  }
}
