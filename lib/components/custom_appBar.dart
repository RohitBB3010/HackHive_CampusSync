import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/consts/colors.dart';
import 'package:campus_sync/consts/empty_spaces.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key, this.titleText, this.icon, required this.context})
      : super(
            title: Row(
              children: [
                Icon(icon),
                widthBetweenFields_1(context!),
                AutoSizeText(
                  titleText!,
                ),
              ],
            ),
            backgroundColor: primary_2,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))));

  final String? titleText;
  final IconData? icon;
  final BuildContext context;
}
