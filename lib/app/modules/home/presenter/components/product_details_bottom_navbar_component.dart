import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nubank_marketplace/app/modules/home/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/pages/product_details/product_details_controller.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/widgets/default_button_widget.dart';
import 'package:nubank_marketplace/app/utils/theme/theme_color.dart';

class ProductDetailsBottomNavbarComponent extends StatelessWidget {
  final String title;
  final ProductDetailsController controller;
  const ProductDetailsBottomNavbarComponent(
      {Key? key,
      this.title = "ProductDetailsBottomNavbarComponent",
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final failPopUp = BeautifulPopup(
      context: context,
      template: TemplateFail,
    );
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            offset: Offset(0, -4),
            blurRadius: 30,
          ),
        ],
      ),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.purchaseEntrie.hasBalance
                        ? Text(
                            'Balance available',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.greenAccent.shade200,
                            ),
                          )
                        : Text(
                            'You don\'t have enough balance for this purchase',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.redAccent.shade200,
                            ),
                          ),
                    Text(
                      'R\$ ${controller.numberFormat.format(controller.offerParamInfo?.balance)}',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: ThemeColor.defaultTheme,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 15),
            Observer(builder: (_) {
              return DefaultButtonWidget(
                onPressed: () async {
                  var result = await controller.newPurchase();

                  if (result is Failure)
                    failPopUp.show(
                      title: 'Ops!',
                      content: result.message,
                      actions: [
                        failPopUp.button(
                          label: 'Verify',
                          onPressed: () {
                            Modular.to.pop();
                          },
                        ),
                      ],
                    );
                },
                backgroundColor: ThemeColor.defaultTheme,
                highlightColor: ThemeColor.defaultDeepTheme,
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
