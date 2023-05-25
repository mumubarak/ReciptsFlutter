import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_button_with_icon.dart';
import '../../../../widgets/space_width.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(15),
      ),
      child: Row(
        children: [
          SizedBox(
            height: AppSizes.getProportionateScreenHeight(45),
            // width: AppSizes.getProportionateScreenWidth(100),
            child: CustomButtonWithIcon(
              text: 'Date',
              icon: Icons.arrow_downward,
              fontSize: 14.sp,
              radius: 30,
              paddingVertical: 0,
              paddinghorizontal: 20,
              fontWeight: FontWeight.normal,
              onPress: () {},
            ),
          ),
          SpaceW(inputWidth: 15),
          SizedBox(
            height: AppSizes.getProportionateScreenHeight(45),
            child: CustomButton(
              text: 'Cost',
              radius: 30,
              fontSize: 14.sp,
              buttonColor: Colors.transparent,
              fontColor: Colors.black,
              borderColor: Colors.black12,
              paddingVertical: 0,
              paddinghorizontal: 25,
              fontWeight: FontWeight.normal,
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }
}
