import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/usecases/get_customer_data.dart';

part 'shop_controller.g.dart';

@Injectable()
class ShopController = ShopControllerBase with _$ShopController;

abstract class ShopControllerBase with Store {
  final GetCustomerData getCustomerDataUseCase;
  ShopControllerBase(this.getCustomerDataUseCase);

  @action
  Future<void> getCustomers() async {
    var result = await getCustomerDataUseCase();
    result?.fold((l) {
      if (l is ConnectionError) {
        print(l.message);
      } else if (l is ErrorGetCustomerData) {
        print(l.message);
      }
    }, (r) {
      print(r);
    });
  }
}
