import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nubank_marketplace/app/utils/theme/theme_color.dart';

class DefaultTitle extends StatelessWidget {
  final String? name;
  final String? balance;
  final bool visible;
  const DefaultTitle({
    Key? key,
    this.name = "DefaultTextInputSearchWidget",
    this.balance = "DefaultSubtitle",
    required this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name ?? '',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              visible
                  ? Text(
                      balance ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        color: ThemeColor.defaultTheme,
                      ),
                    )
                  : SizedBox(
                      width: 160,
                      height: 33,
                      child: Container(
                        color: ThemeColor.widgetBackgroundTheme,
                      ),
                    ),
              SizedBox(width: 6),
            ],
          ),
        ],
      ),
    );
  }
}
