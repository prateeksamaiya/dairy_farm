import 'package:dairy_farm/util/applicaition_util.dart';
import 'package:flutter/material.dart';

class MyDropDownButton extends StatelessWidget {
  final String value;
  final List<String> items;
  final Widget itemIcon;
  final Function onChanged;

  MyDropDownButton({this.value, this.items, this.itemIcon, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: value,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(ApplicationUtil.translate(value)),
        );
      }).toList(),
    );
  }
}
