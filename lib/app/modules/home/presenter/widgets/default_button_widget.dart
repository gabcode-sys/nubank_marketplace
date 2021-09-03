import 'package:flutter/material.dart';
import 'package:nubank_marketplace/app/utils/theme/theme_color.dart';

class DefaultButtonWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Color? highlightColor;
  final Icon icon;
  const DefaultButtonWidget({
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    this.highlightColor,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: icon,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)))),
        fixedSize: MaterialStateProperty.all(Size(16, 65)),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          backgroundColor ?? ThemeColor.widgetBackgroundTheme,
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.pressed))
              return highlightColor ?? Color.fromRGBO(240, 240, 240, 1);
            else
              return Colors.transparent;
          },
        ),
      ),
    );
  }
}
