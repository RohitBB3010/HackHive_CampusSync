import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    super.key,
    required this.items,
    required this.dropdownHeight,
    required this.dropdownWidth,
    required this.hint,
    required this.onChanged,
  });

  final List<DropdownMenuItem<String>> items;
  final double dropdownWidth;
  final double dropdownHeight;
  final Widget hint;
  final void Function(String) onChanged;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      isExpanded: true,
      items: widget.items,
      onChanged: (String? value) {
        if (value != null && widget.items.any((item) => item.value == value)) {
          setState(() {
            selectedValue = value;
            widget.onChanged(selectedValue != null ? selectedValue! : '');
          });
        }
      },
      value: selectedValue,
      hint: widget.hint,
      underline: Container(),
    );
  }
}
