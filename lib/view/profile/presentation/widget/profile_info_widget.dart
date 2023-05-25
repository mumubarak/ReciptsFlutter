import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/space_height.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.getProportionateScreenHeight(190),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(10),
        vertical: AppSizes.getProportionateScreenHeight(15),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Username',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              Text(
                '@${AppStorage.getUserData.userName}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.primaryColorPressed,
                ),
              ),
            ],
          ),
          SpaceH(inputHeigth: 10),
          Container(
            width: AppSizes.screenWidth,
            height: 1,
            color: Colors.black12,
          ),
          SpaceH(inputHeigth: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              Text(
                '*******',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.primaryColorPressed,
                ),
              ),
            ],
          ),
          SpaceH(inputHeigth: 10),
          Container(
            width: AppSizes.screenWidth,
            height: 1,
            color: Colors.black12,
          ),
          SpaceH(inputHeigth: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              Text(
                AppStorage.getUserData.email!,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.primaryColorPressed,
                ),
              ),
            ],
          ),
          SpaceH(inputHeigth: 10),
          Container(
            width: AppSizes.screenWidth,
            height: 1,
            color: Colors.black12,
          ),
          SpaceH(inputHeigth: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Phone number',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              Text(
                '01000000000',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.primaryColorPressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
