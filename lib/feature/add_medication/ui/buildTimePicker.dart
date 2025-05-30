import 'package:firebase_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

Widget buildTimePicker(
    {required String label,
    required TimeOfDay time,
    required VoidCallback onTap,
    required BuildContext context}) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 8),
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: ListTile(
      leading: Icon(Icons.access_time, color: ColorsApp.main_Color_Blue),
      title: Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
      trailing: Text(time.format(context)),
      onTap: onTap,
    ),
  );
}
