import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    print(value);
    value++;
  }
}
