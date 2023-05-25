import 'package:digital_recipts/core/appStorage/app_storage.dart';
import 'package:digital_recipts/core/router/router.dart';
import 'package:digital_recipts/view/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_sizes.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppStorage.signOut();
      },
      child: Container(
        height: AppSizes.getProportionateScreenHeight(60),
        width: AppSizes.screenWidth,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenWidth(10),
          vertical: AppSizes.getProportionateScreenHeight(15),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          'Logout',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: Color.fromRGBO(178, 38, 55, 1),
          ),
        ),
      ),
    );
  }
}
