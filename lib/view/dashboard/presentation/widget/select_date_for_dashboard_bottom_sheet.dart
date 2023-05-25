import 'package:digital_recipts/core/utils/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';

class SelectDateForDashboardBottomSheet extends StatefulWidget {
  SelectDateForDashboardBottomSheet({Key? key}) : super(key: key);

  @override
  State<SelectDateForDashboardBottomSheet> createState() =>
      _SelectDateForDashboardBottomSheetState();
}

class _SelectDateForDashboardBottomSheetState
    extends State<SelectDateForDashboardBottomSheet> {
  DateDashboard selectedDate = DateDashboard.thisMonth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight * 0.3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.getProportionateScreenHeight(20),
          horizontal: AppSizes.getProportionateScreenWidth(25),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
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
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedDate = DateDashboard.thisMonth;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.getProportionateScreenWidth(10),
                          vertical: AppSizes.getProportionateScreenHeight(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'This Month',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            selectedDate == DateDashboard.thisMonth
                                ? Icon(
                                    Icons.check,
                                    color: AppColors.primaryColor,
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: AppSizes.screenWidth,
                      height: 1,
                      color: Colors.grey,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedDate = DateDashboard.quarter;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.getProportionateScreenWidth(10),
                          vertical: AppSizes.getProportionateScreenHeight(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Quarter',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            selectedDate == DateDashboard.quarter
                                ? Icon(
                                    Icons.check,
                                    color: AppColors.primaryColor,
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: AppSizes.screenWidth,
                      height: 1,
                      color: Colors.grey,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedDate = DateDashboard.year;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.getProportionateScreenWidth(10),
                          vertical: AppSizes.getProportionateScreenHeight(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Year',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            selectedDate == DateDashboard.year
                                ? Icon(
                                    Icons.check,
                                    color: AppColors.primaryColor,
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
