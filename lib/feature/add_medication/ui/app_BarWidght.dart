import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

PreferredSizeWidget appBarWidght() {
  return AppBar(
    backgroundColor: Colors.blue.shade800,
    leading: Container(),
    title: Text('إضافة دواء',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: ColorsApp.colors1_Contanir)),
    centerTitle: true,
    elevation: 0,
  );
}
