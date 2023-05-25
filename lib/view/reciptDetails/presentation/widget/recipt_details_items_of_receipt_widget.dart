import 'package:digital_recipts/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/space_height.dart';
import '../../../../widgets/space_width.dart';
import '../controller/recipt_details_cubit.dart';

class ReciptDetailsItemsOfReceiptWidget extends StatelessWidget {
  const ReciptDetailsItemsOfReceiptWidget({Key? key}) : super(key: key);

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
            children: [
              Image.asset(
                AppAssets.cart_icon,
                width: AppSizes.getProportionateScreenWidth(20),
              ),
              SpaceW(inputWidth: 10),
              Text(
                '${cubit.reciptDetailsModel!.results!.items!.length} items',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SpaceH(inputHeigth: 10),
          Container(
            width: AppSizes.screenWidth,
            height: 1,
            color: Colors.grey,
          ),
          SpaceH(inputHeigth: 10),
          Column(
            children: List.generate(
              cubit.reciptDetailsModel!.results!.items!.length,
                  (index) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.getProportionateScreenHeight(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${cubit.reciptDetailsModel!.results!.items![index].quantity}x',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDarkGrayColor,
                          ),
                        ),
                        SpaceW(inputWidth: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cubit.reciptDetailsModel!.results!.items![index].item!,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textDarkGrayColor,
                              ),
                            ),
                            Text(
                              cubit.reciptDetailsModel!.results!.items![index].sId!,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textHintGrayColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.getProportionateScreenHeight(35),
                      width: AppSizes.getProportionateScreenWidth(70),
                      child: CustomButton(
                        text: '${cubit.reciptDetailsModel!.results!.items![index].price} LE',
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
