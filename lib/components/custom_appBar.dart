// ignore: file_names
import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/consts/colors.dart';
import 'package:campus_sync/consts/empty_spaces.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
      {super.key,
      required this.titleText,
      this.icon,
      required this.context,
      this.appBarHeight})
      : super(
            toolbarHeight: appBarHeight,
            leadingWidth: MediaQuery.of(context).size.width * 0.05,
            title: Row(
              children: [
                Icon(
                  icon,
                  color: primary_1,
                  size: 35,
                ),
                widthBetweenFields_1(context),
                AutoSizeText(
                  titleText,
                  maxLines: 1,
                  style: TextStyle(color: primary_1, fontSize: 30),
                ),
              ],
            ),
            backgroundColor: secondary_3,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))));

  final String titleText;
  final IconData? icon;
  final BuildContext context;
  final double? appBarHeight;
}
