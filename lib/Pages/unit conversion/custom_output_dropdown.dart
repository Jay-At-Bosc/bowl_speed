
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/controllers/unit_conversion_controller.dart';
import '../../utils/enums.dart';

class CustomOutputDropdown<T extends Unit> extends GetView<UnitConversionController> {
  const CustomOutputDropdown(
      {super.key,
      required this.dropdownValue,
      required this.dropdownItems,
      this.dropdownonChanged,
      required this.result});

  final String result;
  final T dropdownValue;
  final List<T> dropdownItems;
  final void Function(T?)? dropdownonChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 5,
          child: DropdownButton<T>(
            value: dropdownValue,
            items: dropdownItems.map((T unit) {
              return DropdownMenuItem<T>(
                value: unit,
                child: Text(unit.getLabel),
              );
            }).toList(),
            onChanged: dropdownonChanged,
          ),
        ),
        SizedBox(width: 6),
        Flexible(
          flex: 4,
          child: GetBuilder<UnitConversionController>(
              builder: (context) {
                return TextField(
                  readOnly: true,
                  decoration:
                      InputDecoration(labelText: result, enabled: false),
                );
              }),
        ),
      ],
    );
  }
}
