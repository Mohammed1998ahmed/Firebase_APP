import 'dart:async';

import 'package:firebase_app/core/helper/extension.dart';
import 'package:flutter/material.dart';

import '../../../core/router/routes.dart';
import '../../../notify.dart';

class topAppBar extends StatelessWidget {
  const topAppBar({
    super.key,
    required this.context,
  });
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            context.pushNamed(Routes.medication);
          },
          icon: Icon(
            Icons.notifications,
            size: 30,
          )),
      actions: [
        IconButton(
            onPressed: () async {
              await Notify.checkAndNotifyFromFirebase();
              Timer.periodic(Duration(minutes: 1), (timer) {
                Notify.checkAndNotifyFromFirebase();
              });
            },
            icon: Icon(
              Icons.settings,
              size: 30,
            ))
      ],
    );
  }
}
