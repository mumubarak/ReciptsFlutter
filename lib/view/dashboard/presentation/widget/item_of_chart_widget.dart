import 'package:digital_recipts/view/dashboard/presentation/widget/type_details_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/space_width.dart';

class ItemOfChartWidget extends StatelessWidget {
  ItemOfChartWidget({Key? key}) : super(key: key);

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
            return TypeDetailsBottomSheet();
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenWidth(5),
          vertical: AppSizes.getProportionateScreenHeight(5),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: AppSizes.getProportionateScreenHeight(10),
                      width: AppSizes.getProportionateScreenWidth(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.yellowColor,
                      ),
                    ),
                    SpaceW(inputWidth: 10),
                    Text(
                      'Supermarket',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '12%',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SpaceW(inputWidth: 10),
                    Text(
                      '1256',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
