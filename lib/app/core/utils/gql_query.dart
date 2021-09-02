mixin GqlQuery {
  static String customerDataQuery = '''
  query {
    viewer {
      id
      name
      balance
      offers {
        id
        price
        product {
          id
          name
          description
          image
        }
      }
    }
  }
  ''';

  static String newPurchaseQuery = '''
  mutation newPurchase(\$offerId: ID!) {
    purchase(offerId: \$offerId) {
      success
      errorMessage
      customer{
        id
        name
        balance
      }
    }
  }''';
}
