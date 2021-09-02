class PurchaseEntrie {
  final dynamic offerId;
  final double price;
  final double balance;

  PurchaseEntrie._({
    required this.offerId,
    required this.price,
    required this.balance,
  });

  bool get isValidOfferId => offerId != null && offerId.isNotEmpty;

  bool get hasBalance => balance >= price;

  factory PurchaseEntrie.newPucharse({
    required dynamic offerId,
    required double price,
    required double balance,
  }) {
    return PurchaseEntrie._(
      offerId: offerId,
      price: price,
      balance: balance,
    );
  }
}
