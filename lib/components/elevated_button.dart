import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:campus_sync/components/custom_text_field.dart';
import 'package:campus_sync/components/elevated_button.dart';
import 'package:campus_sync/consts/empty_spaces.dart';
import 'package:campus_sync/consts/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  final String title;
  final dynamic onPressed;
  final double? buttonWidth;
  final double? buttonHeight;

  const CustomElevatedButton(
      {Key? key,
      required this.title,
      this.icon,
      this.color,
      this.buttonWidth,
      this.buttonHeight,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: buttonHeight ?? MediaQuery.of(context).size.height * 0.08,
      width: buttonWidth ?? MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: color ?? accent_2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            if (icon != null) widthBetweenFields_2(context),
            AutoSizeText(
              title,
              maxLines: 1,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
