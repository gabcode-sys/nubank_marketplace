// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ShopController = BindInject(
  (i) => ShopController(i<GetCustomerData>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShopController on ShopControllerBase, Store {
  final _$getCustomersAsyncAction =
      AsyncAction('ShopControllerBase.getCustomers');

  @override
  Future<void> getCustomers() {
    return _$getCustomersAsyncAction.run(() => super.getCustomers());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
