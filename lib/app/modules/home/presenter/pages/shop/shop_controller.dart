import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/customer_data_info.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/offer_info.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/offer_param_info.dart';
import 'package:nubank_marketplace/app/modules/home/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/home/domain/usecases/get_customer_data.dart';

part 'shop_controller.g.dart';

@Injectable()
class ShopController = ShopControllerBase with _$ShopController;

abstract class ShopControllerBase with Store {
  final GetCustomerData getCustomerDataUseCase;
  ShopControllerBase(this.getCustomerDataUseCase);

  @observable
  NumberFormat numberFormat = NumberFormat("#,##0.00", "pt_BR");

  @observable
  bool showBalance = false;

  @observable
  String customerName = '';

  @observable
  double customerBalance = 0;

  @observable
  ObservableList<OfferInfo> offers = new ObservableList<OfferInfo>();

  @action
  setShowBalance(bool value) => this.showBalance = value;

  @action
  toProductDetailsPage(OfferParamInfo offerParam) async =>
      await Modular.to.pushNamed(
        '/product_details',
        arguments: offerParam,
      );

  @action
  setCustomerBalance(double value) => this.customerBalance = value;

  @action
  Future<dynamic> getCustomers() async {
    var result = await getCustomerDataUseCase();

    return result!.fold((l) {
      return l;
    }, (CustomerDataInfo? r) {
      List<OfferInfo> offersReturn = r?.offers;
      customerName = r?.name;
      customerBalance = r?.balance;
      this.offers = offersReturn.asObservable();
      return true;
    });
  }
}
