import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/widght/circalarSignIn.dart';

class SignInOther extends StatelessWidget {
  const SignInOther({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularWidght(
          assetName: 'assets/images/f.png',
          color: ColorsApp.circular_1,
        ),
        CircularWidght(
          assetName: 'assets/images/in.png',
          color: ColorsApp.circular_1,
        ),
        CircularWidght(
          assetName: 'assets/images/p.png',
          color: ColorsApp.circular_2,
        ),
        CircularWidght(
          assetName: 'assets/images/in.png',
          color: ColorsApp.circular_3,
        )
      ],
    );
  }
}
