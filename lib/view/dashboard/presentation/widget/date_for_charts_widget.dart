import 'package:digital_recipts/core/utils/app_sizes.dart';
import 'package:digital_recipts/view/dashboard/presentation/widget/select_date_for_dashboard_bottom_sheet.dart';
import 'package:digital_recipts/widgets/space_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateForChartsWidget extends StatelessWidget {
  const DateForChartsWidget({Key? key}) : super(key: key);

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
            return SelectDateForDashboardBottomSheet();
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenWidth(15),
        ),
        child: Container(
          width: AppSizes.screenWidth,
          decoration: BoxDecoration(
            color: Color.fromRGBO(233, 234, 235, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(10),
              vertical: AppSizes.getProportionateScreenHeight(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'December 2022',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SpaceW(inputWidth: 10),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
