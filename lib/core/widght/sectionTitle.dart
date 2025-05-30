import 'package:firebase_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

Widget sectionTitle(String text) => Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(text,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ColorsApp.main_Color_Blue)),
    );
