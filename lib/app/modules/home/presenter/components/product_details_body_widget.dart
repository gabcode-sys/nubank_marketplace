import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/pages/product_details/product_details_controller.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/widgets/default_button_widget.dart';
import 'package:nubank_marketplace/app/utils/theme/theme_color.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetailsBodyWidget extends StatelessWidget {
  final String title;
  final ProductDetailsController controller;
  const ProductDetailsBodyWidget(
      {Key? key,
      this.title = "ProductDetailsBodyWidget",
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      'R\$ ${controller.numberFormat.format(controller.offerParamInfo?.offer.price)}',
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
                  DefaultButtonWidget(
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
    );
  }
}
