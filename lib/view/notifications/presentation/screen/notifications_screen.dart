import 'package:digital_recipts/core/utils/app_colors.dart';
import 'package:digital_recipts/widgets/space_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/router/router.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/space_width.dart';
import '../widget/notifications_list_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

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
          horizontal: AppSizes.getProportionateScreenWidth(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                  onPressed: () {
                    MagicRouter.pop();
                  },
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: AppSizes.getProportionateScreenHeight(40),
                  child: CustomButton(
                    text: 'All',
                    radius: 30,
                    paddingVertical: 0,
                    paddinghorizontal: 25,
                    onPress: () {},
                  ),
                ),
                SpaceW(inputWidth: 15),
                SizedBox(
                  height: AppSizes.getProportionateScreenHeight(40),
                  child: CustomButton(
                    text: 'Unread',
                    radius: 30,
                    buttonColor: Colors.transparent,
                    fontColor: Colors.black,
                    borderColor: Colors.black12,
                    paddingVertical: 0,
                    paddinghorizontal: 25,
                    onPress: () {},
                  ),
                ),
              ],
            ),
            SpaceH(inputHeigth: 10),
            NotificationsListWidget(),
          ],
        ),
      ),
    );
  }
}
