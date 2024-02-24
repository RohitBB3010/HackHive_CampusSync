import 'package:flutter/material.dart';
import 'package:campus_sync/consts/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: secondary_2,
      ),
      child: Text(title),
    );
  }
}
