import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.screenWidth,
      height: AppSizes.screenHeight,
      child: Image.asset(
        AppAssets.logo,
      ),
    );
  }
}
