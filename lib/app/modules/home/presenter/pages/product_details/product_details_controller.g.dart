// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProductDetailsController = BindInject(
  (i) =>
      ProductDetailsController(i<NewPurchase>(), offerParamInfo: i.args?.data),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductDetailsController on ProductDetailsControllerBase, Store {
  Computed<PurchaseEntrie>? _$purchaseEntrieComputed;

  @override
  PurchaseEntrie get purchaseEntrie => (_$purchaseEntrieComputed ??=
          Computed<PurchaseEntrie>(() => super.purchaseEntrie,
              name: 'ProductDetailsControllerBase.purchaseEntrie'))
      .value;
  Computed<bool>? _$isValidPurchaseEntrieComputed;

  @override
  bool get isValidPurchaseEntrie => (_$isValidPurchaseEntrieComputed ??=
          Computed<bool>(() => super.isValidPurchaseEntrie,
              name: 'ProductDetailsControllerBase.isValidPurchaseEntrie'))
      .value;

  final _$numberFormatAtom =
      Atom(name: 'ProductDetailsControllerBase.numberFormat');

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

  final _$panelControllerAtom =
      Atom(name: 'ProductDetailsControllerBase.panelController');

  @override
  PanelController get panelController {
    _$panelControllerAtom.reportRead();
    return super.panelController;
  }

  @override
  set panelController(PanelController value) {
    _$panelControllerAtom.reportWrite(value, super.panelController, () {
      super.panelController = value;
    });
  }

  final _$newPurchaseAsyncAction =
      AsyncAction('ProductDetailsControllerBase.newPurchase');

  @override
  Future<dynamic> newPurchase() {
    return _$newPurchaseAsyncAction.run(() => super.newPurchase());
  }

  @override
  String toString() {
    return '''
numberFormat: ${numberFormat},
panelController: ${panelController},
purchaseEntrie: ${purchaseEntrie},
isValidPurchaseEntrie: ${isValidPurchaseEntrie}
    ''';
  }
}
