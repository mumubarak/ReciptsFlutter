import 'package:digital_recipts/core/utils/app_colors.dart';
import 'package:digital_recipts/view/dashboard/presentation/widget/type_details_bottom_sheet.dart';
import 'package:digital_recipts/widgets/space_height.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/space_width.dart';

class ReportDashboardWidget extends StatelessWidget {
  const ReportDashboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenWidth(15),
        ),
        child: Container(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
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
                      return TypeDetailsBottomSheet();
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.getProportionateScreenWidth(5),
                    vertical: AppSizes.getProportionateScreenHeight(7),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.getProportionateScreenHeight(15),
                      horizontal: AppSizes.getProportionateScreenWidth(10),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fruits & Vegetables',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.textDarkGrayColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SpaceH(inputHeigth: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Cost',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textHintGrayColor,
                                        ),
                                      ),
                                      SpaceW(inputWidth: 5),
                                      Text(
                                        '5000 LE',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'No of receipts',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textHintGrayColor,
                                        ),
                                      ),
                                      SpaceW(inputWidth: 5),
                                      Text(
                                        '23',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SpaceW(inputWidth: 10),
                        Expanded(
                          flex: 1,
                          child: CircularPercentIndicator(
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
                                color: Colors.black,
                              ),
                            ),
                            backgroundColor: Color.fromRGBO(233, 234, 235, 1),
                            progressColor: AppColors.yellowColorPressed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
