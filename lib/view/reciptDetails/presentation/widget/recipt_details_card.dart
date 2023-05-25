import 'package:digital_recipts/view/reciptDetails/presentation/controller/recipt_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/space_height.dart';
import '../../../../widgets/space_width.dart';

class ReciptDetailsCard extends StatelessWidget {
  const ReciptDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ReciptDetailsCubit.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(5),
      ),
      child: Container(
        width: AppSizes.screenWidth,
        height: AppSizes.getProportionateScreenHeight(100),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenWidth(10),
          vertical: AppSizes.getProportionateScreenHeight(5),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: AppSizes.getProportionateScreenHeight(80),
              width: AppSizes.getProportionateScreenHeight(80),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.getProportionateScreenWidth(15),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Image.asset(AppAssets.zara_logo),
            ),
            SpaceW(inputWidth: 10),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cubit.reciptDetailsModel!.results!.vendor!.vendorName ?? '',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textDarkGrayColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    cubit.reciptDetailsModel!.results!.vendor!.sId ?? '',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textHintGrayColor,
                    ),
                  ),
                  SpaceH(inputHeigth: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${cubit.reciptDetailsModel!.results!.items!.length} items',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SpaceW(inputWidth: 10),
                      Text(cubit.formatDate(DateFormat.yMMMd('en_US'),
                          cubit.reciptDetailsModel!.results!.dateTime! ?? '')),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: AppSizes.getProportionateScreenHeight(35),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.getProportionateScreenWidth(5),
                    ),
                    child: CustomButton(
                      text: '${cubit.reciptDetailsModel!.results!.totalAmount} LE',
                      fontSize: 12.sp,
                      radius: 30,
                      buttonColor: AppColors.yellowColor,
                      fontColor: Colors.black,
                      paddingVertical: 0,
                      paddinghorizontal: 0,
                      onPress: () {},
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
