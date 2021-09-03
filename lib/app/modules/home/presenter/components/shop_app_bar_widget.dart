import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/pages/shop/shop_controller.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/widgets/default_button_widget.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/widgets/default_title_widget.dart';
import 'package:nubank_marketplace/app/utils/theme/theme_color.dart';

class ShopAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  ShopAppBarWidget({
    required ShopController controller,
  }) : controller = controller;

  final ShopController controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 55,
        bottom: 15,
      ),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Observer(builder: (_) {
                return DefaultTitleWidget(
                  name: controller.customerName,
                  balance: controller.numberFormat
                      .format(controller.customerBalance),
                  visible: controller.showBalance,
                );
              }),
            ),
            SizedBox(width: 15),
            Observer(builder: (_) {
              return DefaultButtonWidget(
                onPressed: () {
                  controller.setShowBalance(!controller.showBalance);
                },
                icon: controller.showBalance
                    ? Icon(
                        Icons.visibility_outlined,
                        color: ThemeColor.defaultTheme,
                      )
                    : Icon(
                        Icons.visibility_off_outlined,
                        color: ThemeColor.widgetForegroundTheme,
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160);
}
