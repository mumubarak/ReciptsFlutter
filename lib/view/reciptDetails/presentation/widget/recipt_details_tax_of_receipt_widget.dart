import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/space_height.dart';
import '../controller/recipt_details_cubit.dart';

class ReciptDetailsTaxOfReceiptWidget extends StatelessWidget {
  const ReciptDetailsTaxOfReceiptWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ReciptDetailsCubit.of(context);
    return Container(
      width: AppSizes.screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(10),
        vertical: AppSizes.getProportionateScreenHeight(15),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'VAT 14%',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDarkGrayColor,
                ),
              ),
              SizedBox(
                height: AppSizes.getProportionateScreenHeight(35),
                width: AppSizes.getProportionateScreenWidth(70),
                child: CustomButton(
                  text: '${cubit.reciptDetailsModel!.results!.service} LE',
                  fontSize: 12.sp,
                  radius: 30,
                  buttonColor: AppColors.grayColor2,
                  fontColor: AppColors.primaryColor,
                  paddingVertical: 0,
                  paddinghorizontal: 0,
                  onPress: () {},
                ),
              ),
            ],
          ),
          SpaceH(inputHeigth: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDarkGrayColor,
                ),
              ),
              SizedBox(
                height: AppSizes.getProportionateScreenHeight(35),
                width: AppSizes.getProportionateScreenWidth(70),
                child: CustomButton(
                  text: '${cubit.reciptDetailsModel!.results!.tax} LE',
                  fontSize: 12.sp,
                  radius: 30,
                  buttonColor: AppColors.grayColor2,
                  fontColor: AppColors.primaryColor,
                  paddingVertical: 0,
                  paddinghorizontal: 0,
                  onPress: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
