import 'package:firebase_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

Widget buildDropdown({
  required String label,
  required IconData icon,
  required String value,
  required List<String> items,
  String? suffix,
  required void Function(String?) onChanged,
}) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 8),
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: ListTile(
      leading: Icon(icon, color: ColorsApp.main_Color_Blue),
      title: Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        DropdownButton<String>(
          value: value,
          underline: SizedBox(),
          items: items
              .map((i) => DropdownMenuItem(value: i, child: Text(i)))
              .toList(),
          onChanged: onChanged,
        ),
        if (suffix != null)
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(suffix, style: TextStyle(color: Colors.grey[600])),
          )
      ]),
    ),
  );
}
