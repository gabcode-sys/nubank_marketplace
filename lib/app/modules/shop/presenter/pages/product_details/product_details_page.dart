import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/errors/errors.dart';
import 'package:nubank_marketplace/app/modules/shop/presenter/pages/product_details/product_details_controller.dart';
import 'package:nubank_marketplace/app/modules/shop/presenter/widgets/default_filter_button_widget.dart';
import 'package:nubank_marketplace/app/utils/theme/theme_color.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetailsPage extends StatefulWidget {
  final String title;
  const ProductDetailsPage({Key? key, this.title = 'ProductDetailsPage'})
      : super(key: key);
  @override
  ProductDetailsPageState createState() => ProductDetailsPageState();
}

class ProductDetailsPageState
    extends ModularState<ProductDetailsPage, ProductDetailsController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final failPopUp = BeautifulPopup(
      context: context,
      template: TemplateFail,
    );

    final connectionErrorPopUp = BeautifulPopup(
      context: context,
      template: TemplateBlueRocket,
    );

    return Scaffold(
      body: Stack(
        children: [
          SlidingUpPanel(
            controller: controller.panelController,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
            ),
            parallaxEnabled: true,
            parallaxOffset: 0.4,
            boxShadow: [],
            maxHeight: MediaQuery.of(context).size.height,
            minHeight: 300,
            body: Container(
              alignment: Alignment.topCenter,
              color: ThemeColor.widgetBackgroundTheme,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                child: FadeInImage.memoryNetwork(
                  width: MediaQuery.of(context).size.width,
                  placeholder: kTransparentImage,
                  image: controller.offerParamInfo?.offer.product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            panel: Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 5,
                        decoration: BoxDecoration(
                            color: ThemeColor.widgetBackgroundTheme,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'R\$ ${controller.offerParamInfo?.offer.price}',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${controller.offerParamInfo?.offer.product.name}',
                      style: GoogleFonts.poppins(
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Text(
                    '${controller.offerParamInfo?.offer.product.description}',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ThemeColor.widgetForegroundTheme,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                height: 80,
                child: Row(
                  children: [
                    DefaultFilterButtonWidget(
                      onPressed: () {
                        Modular.to.pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                      backgroundColor: Colors.white.withOpacity(0.3),
                      highlightColor: Colors.white.withOpacity(0.5),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
          ),
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
                              'Saldo disponível',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.greenAccent.shade200,
                              ),
                            )
                          : Text(
                              'Você não tem saldo disponível para esta compra',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.redAccent.shade200,
                              ),
                            ),
                      Text(
                        'R\$ ${controller.offerParamInfo?.balance}',
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
                return DefaultFilterButtonWidget(
                  onPressed: () async {
                    var result = await controller.newPurchase();

                    if (result is ConnectionError) {
                      connectionErrorPopUp.show(
                        title: 'Você está desconectado',
                        content: 'Você não tem conexão com a internet',
                        actions: [
                          failPopUp.button(
                            label: 'Verificar',
                            onPressed: () {
                              Modular.to.pop();
                            },
                          ),
                        ],
                        // bool barrierDismissible = false,
                        // Widget close,
                      );
                    } else if (result is NoBalance) {
                      failPopUp.show(
                        title: 'Saldo insuficiente',
                        content:
                            'Ops! Parece que você não tem saldo insuficiente para esta compra',
                        actions: [
                          failPopUp.button(
                            label: 'Verificar',
                            onPressed: () {
                              Modular.to.pop();
                            },
                          ),
                        ],
                        // bool barrierDismissible = false,
                        // Widget close,
                      );
                    }
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
      ),
    );
  }
}
