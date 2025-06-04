import 'package:firebase_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

Widget buildInputField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  String? Function(String?)? validator,
  int maxLines = 1,
}) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 8),
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        decoration: InputDecoration(
          icon: Icon(icon, color: ColorsApp.main_Color_Blue),
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    ),
  );
}
