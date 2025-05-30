import 'package:firebase_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildDatePicker({
  required String label,
  required DateTime date,
  required VoidCallback onTap,
}) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 8),
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: ListTile(
      leading: Icon(Icons.calendar_today, color: ColorsApp.main_Color_Blue),
      title: Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
      trailing: Text(DateFormat('yyyy/MM/dd').format(date)),
      onTap: onTap,
    ),
  );
}
