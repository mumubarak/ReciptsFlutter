import 'package:digital_recipts/core/models/recipts_model.dart';
import 'package:digital_recipts/widgets/recipt_card.dart';
import 'package:digital_recipts/widgets/space_height.dart';
import 'package:digital_recipts/widgets/space_width.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/router/router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';

class TypeDetailsBottomSheet extends StatelessWidget {
  const TypeDetailsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight * 0.95,
      decoration: const BoxDecoration(
        color: AppColors.grayColor2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.getProportionateScreenHeight(20),
          horizontal: AppSizes.getProportionateScreenWidth(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Supermarket',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.textDarkGrayColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                  onPressed: () {
                    MagicRouter.pop();
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'December 2022',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textHintGrayColor,
                ),
              ),
            ),
            SpaceH(inputHeigth: 10),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.getProportionateScreenHeight(5),
                horizontal: AppSizes.getProportionateScreenWidth(15),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: AppSizes.getProportionateScreenHeight(35),
                        child: CustomButton(
                          text: '130 LE',
                          fontSize: 12.sp,
                          radius: 30,
                          buttonColor: AppColors.yellowColor,
                          fontColor: Colors.black,
                          paddingVertical: 0,
                          paddinghorizontal: 20,
                          onPress: () {},
                        ),
                      ),
                      SpaceH(inputHeigth: 10),
                      Row(
                        children: [
                          Text(
                            'receipts',
                            style: TextStyle(
                              color: AppColors.textHintGrayColor,
                              fontSize: 12.sp,
                            ),
                          ),
                          SpaceW(inputWidth: 10),
                          Text(
                            '23',
                            style: TextStyle(
                              color: AppColors.textDarkGrayColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircularPercentIndicator(
                    radius: AppSizes.screenWidth * 0.1,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 6,
                    percent: 0.1,
                    center: Text(
                      "10%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    backgroundColor: Color.fromRGBO(233, 234, 235, 1),
                    progressColor: AppColors.yellowColorPressed,
                  ),
                ],
              ),
            ),
            SpaceH(inputHeigth: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Receipts',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDarkGrayColor,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.getProportionateScreenHeight(5),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ReciptCard(
                        date: '2023-02-13',
                        reciptItem: ReciptItem(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
