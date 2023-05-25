import 'package:digital_recipts/core/utils/app_colors.dart';
import 'package:digital_recipts/view/reciptDetails/presentation/controller/recipt_details_cubit.dart';
import 'package:digital_recipts/widgets/space_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../core/models/recipts_model.dart';
import '../core/utils/app_assets.dart';
import '../core/utils/app_sizes.dart';
import '../view/reciptDetails/presentation/screen/recipt_details_screen.dart';
import 'custom_button.dart';
import 'space_width.dart';

class ReciptCard extends StatelessWidget {
  ReciptCard({Key? key, required this.reciptItem, required this.date})
      : super(key: key);

  final ReciptItem reciptItem;
  final String date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          builder: (BuildContext context) {
            return ReciptDetailsScreen(
            );
          },
        );
      },
      child: Padding(
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
            borderRadius: BorderRadius.circular(15),
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
                      reciptItem.item ?? '',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.textDarkGrayColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SpaceH(inputHeigth: 5),
                    Text(
                      reciptItem.sId ?? '',
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
                          "${reciptItem.quantity.toString() ?? '0'} items",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SpaceW(inputWidth: 5),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        text: "${reciptItem.price.toString() ?? ''}LE",
                        fontSize: 12.sp,
                        radius: 30,
                        buttonColor: AppColors.grayColor2,
                        fontColor: AppColors.primaryColor,
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
      ),
    );
  }
}
