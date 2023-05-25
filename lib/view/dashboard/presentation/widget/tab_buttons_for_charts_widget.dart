import 'package:digital_recipts/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_sizes.dart';
import '../controller/dashboard_cubit.dart';

class TabButtonsForChartsWidget extends StatelessWidget {
  const TabButtonsForChartsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        final cubitDashboard = DashboardCubit.of(context);
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(15),
          ),
          child: Container(
            width: AppSizes.screenWidth * 0.75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      cubitDashboard.changeTabButtons('pin');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: cubitDashboard.chart == Charts.pin
                            ? AppColors.primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.getProportionateScreenHeight(5),
                      ),
                      child: Container(
                        height: AppSizes.getProportionateScreenHeight(27),
                        child: Image.asset(
                          AppAssets.pin_icon,
                          color: cubitDashboard.chart == Charts.pin
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      cubitDashboard.changeTabButtons('line');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: cubitDashboard.chart == Charts.line
                            ? AppColors.primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.getProportionateScreenHeight(5),
                      ),
                      child: Container(
                        height: AppSizes.getProportionateScreenHeight(27),
                        child: Image.asset(
                          AppAssets.line_icon,
                          color: cubitDashboard.chart == Charts.line
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      cubitDashboard.changeTabButtons('report');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: cubitDashboard.chart == Charts.report
                            ? AppColors.primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.getProportionateScreenHeight(5),
                      ),
                      child: Container(
                        height: AppSizes.getProportionateScreenHeight(27),
                        child: Image.asset(
                          AppAssets.report_icon,
                          color: cubitDashboard.chart == Charts.report
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
