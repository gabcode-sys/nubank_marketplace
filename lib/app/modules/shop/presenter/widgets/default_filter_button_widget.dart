import 'package:flutter/material.dart';
import 'package:nubank_marketplace/app/utils/theme/theme_color.dart';

class DefaultFilterButtonWidget extends StatelessWidget {
  final String title;
  final bool visible;
  const DefaultFilterButtonWidget({
    Key? key,
    this.title = "DefaultFilterButtonWidget",
    required this.onPressed,
    required this.visible,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: visible
          ? Icon(
              Icons.visibility_outlined,
              color: ThemeColor.defaultTheme,
            )
          : Icon(
              Icons.visibility_off_outlined,
              color: ThemeColor.widgetForegroundTheme,
            ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)))),
        fixedSize: MaterialStateProperty.all(Size(16, 65)),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          ThemeColor.widgetBackgroundTheme,
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.pressed))
              return Color.fromRGBO(240, 240, 240, 1);
            else
              return Colors.transparent;
          },
        ),
      ),
    );
  }
}
