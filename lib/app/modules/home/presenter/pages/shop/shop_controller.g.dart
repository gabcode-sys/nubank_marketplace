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
  final _$numberFormatAtom = Atom(name: 'ShopControllerBase.numberFormat');

  @override
  NumberFormat get numberFormat {
    _$numberFormatAtom.reportRead();
    return super.numberFormat;
  }

  @override
  set numberFormat(NumberFormat value) {
    _$numberFormatAtom.reportWrite(value, super.numberFormat, () {
      super.numberFormat = value;
    });
  }

  final _$showBalanceAtom = Atom(name: 'ShopControllerBase.showBalance');

  @override
  bool get showBalance {
    _$showBalanceAtom.reportRead();
    return super.showBalance;
  }

  @override
  set showBalance(bool value) {
    _$showBalanceAtom.reportWrite(value, super.showBalance, () {
      super.showBalance = value;
    });
  }

  final _$customerNameAtom = Atom(name: 'ShopControllerBase.customerName');

  @override
  String get customerName {
    _$customerNameAtom.reportRead();
    return super.customerName;
  }

  @override
  set customerName(String value) {
    _$customerNameAtom.reportWrite(value, super.customerName, () {
      super.customerName = value;
    });
  }

  final _$customerBalanceAtom =
      Atom(name: 'ShopControllerBase.customerBalance');

  @override
  double get customerBalance {
    _$customerBalanceAtom.reportRead();
    return super.customerBalance;
  }

  @override
  set customerBalance(double value) {
    _$customerBalanceAtom.reportWrite(value, super.customerBalance, () {
      super.customerBalance = value;
    });
  }

  final _$offersAtom = Atom(name: 'ShopControllerBase.offers');

  @override
  ObservableList<OfferInfo> get offers {
    _$offersAtom.reportRead();
    return super.offers;
  }

  @override
  set offers(ObservableList<OfferInfo> value) {
    _$offersAtom.reportWrite(value, super.offers, () {
      super.offers = value;
    });
  }

  final _$toProductDetailsPageAsyncAction =
      AsyncAction('ShopControllerBase.toProductDetailsPage');

  @override
  Future toProductDetailsPage(OfferParamInfo offerParam) {
    return _$toProductDetailsPageAsyncAction
        .run(() => super.toProductDetailsPage(offerParam));
  }

  final _$getCustomersAsyncAction =
      AsyncAction('ShopControllerBase.getCustomers');

  @override
  Future<dynamic> getCustomers() {
    return _$getCustomersAsyncAction.run(() => super.getCustomers());
  }

  final _$ShopControllerBaseActionController =
      ActionController(name: 'ShopControllerBase');

  @override
  dynamic setShowBalance(bool value) {
    final _$actionInfo = _$ShopControllerBaseActionController.startAction(
        name: 'ShopControllerBase.setShowBalance');
    try {
      return super.setShowBalance(value);
    } finally {
      _$ShopControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCustomerBalance(double value) {
    final _$actionInfo = _$ShopControllerBaseActionController.startAction(
        name: 'ShopControllerBase.setCustomerBalance');
    try {
      return super.setCustomerBalance(value);
    } finally {
      _$ShopControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
numberFormat: ${numberFormat},
showBalance: ${showBalance},
customerName: ${customerName},
customerBalance: ${customerBalance},
offers: ${offers}
    ''';
  }
}
