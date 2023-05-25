import 'package:digital_recipts/widgets/space_height.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/space_width.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.getProportionateScreenWidth(10),
                ),
                child: Container(
                  height: AppSizes.getProportionateScreenHeight(10),
                  width: AppSizes.getProportionateScreenWidth(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.yellowColor,
                  ),
                ),
              ),
              SpaceW(inputWidth: 5),
              Text(
                'Carrefour',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDarkGrayColor,
                ),
              ),
            ],
          ),
          SpaceH(inputHeigth: 10),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppSizes.getProportionateScreenWidth(35),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You added a new receipt for CareFour Hiber Market. You can view it now.',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'lib/fonts/Roboto-Regular.ttf'
                        ),
                      ),
                      SpaceH(inputHeigth: 5),
                      Text(
                        '03 Dec, 2022. (1d ago)',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textHintGrayColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SpaceW(inputWidth: 8),
              Container(
                width: AppSizes.getProportionateScreenHeight(65),
                height: AppSizes.getProportionateScreenHeight(65),
                child: Image.asset(
                  AppAssets.zara_logo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
