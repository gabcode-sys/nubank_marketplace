import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nubank_marketplace/app/modules/home/domain/entities/purchase_info.dart';
import 'package:nubank_marketplace/app/modules/home/infra/models/offer_param_model.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/pages/shop/shop_controller.dart';
import 'package:nubank_marketplace/app/utils/theme/theme_color.dart';
import 'package:transparent_image/transparent_image.dart';

class ShopBodyComponent extends StatelessWidget {
  final String title;
  final ShopController controller;
  const ShopBodyComponent({
    Key? key,
    this.title = "DefaultBodyWidget",
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.white,
      color: ThemeColor.defaultTheme,
      onRefresh: () async {
        await controller.getCustomers();
      },
      child: FutureBuilder<bool>(
          future: controller.getCustomers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(
                  color: ThemeColor.defaultTheme,
                ),
              );
            return StaggeredGridView.countBuilder(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 30,
                itemCount: controller.offers.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      var purchase = await controller.toProductDetailsPage(
                        OfferParamModel(
                          balance: controller.customerBalance,
                          offer: controller.offers[index],
                        ),
                      );

                      if (purchase != null) if (purchase.success) {
                        if (purchase is PurchaseInfo) {
                          controller
                              .setCustomerBalance(purchase.customer.balance);
                          BeautifulPopup(
                            context: context,
                            template: TemplateCoin,
                          ).show(
                            title: 'Successful!',
                            content: 'The order has been registered',
                          );
                        }
                      } else {
                        BeautifulPopup(
                          context: context,
                          template: TemplateFail,
                        ).show(
                          title: 'Ops!',
                          content: purchase.errorMessage,
                        );
                      }
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                color: ThemeColor.widgetBackgroundTheme,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: controller.offers[index].product.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'R\$ ',
                                        style: GoogleFonts.poppins(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '${controller.numberFormat.format(controller.offers[index].price)}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '${controller.offers[index].product.name}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeColor.widgetForegroundTheme,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(1, index.isEven ? 1.7 : 1.4);
                });
          }),
    );
  }
}
