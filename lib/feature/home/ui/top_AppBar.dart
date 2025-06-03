import 'package:firebase_app/core/helper/extension.dart';
import 'package:firebase_app/core/helper/shared_phreferance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/router/routes.dart';

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
              try {
                context.pushReplacementNamed(Routes.login_page);
                await FirebaseAuth.instance.signOut();
                SharedPreferencesService().setBool(key: "user", value: false);
                print('تم تسجيل الخروج بنجاح');
              } catch (e) {
                print('حدث خطأ أثناء تسجيل الخروج: $e');
              }
            },
            // () {
            //   print("************************");
            //   // await Notify.checkAndNotifyFromFirebase();
            //   // Timer.periodic(Duration(minutes: 1), (timer) {
            //   //   Notify.checkAndNotifyFromFirebase();
            //   // });
            // },
            icon: Icon(
              Icons.logout,
              size: 30,
            ))
      ],
    );
  }
}
