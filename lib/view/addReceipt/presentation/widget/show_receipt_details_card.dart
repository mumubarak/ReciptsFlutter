import 'package:digital_recipts/core/utils/app_colors.dart';
import 'package:digital_recipts/view/addReceipt/presentation/controller/add_receipt_cubit.dart';
import 'package:digital_recipts/widgets/space_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/space_width.dart';

class ShowReceiptDetailsCard extends StatelessWidget {
  const ShowReceiptDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubitAddReceipt = AddReceiptCubit.of(context);
    return Padding(
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: AppSizes.getProportionateScreenHeight(80),
              width: AppSizes.getProportionateScreenHeight(80),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.getProportionateScreenWidth(5),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Image.asset(AppAssets.zara_logo),
            ),
            SpaceW(inputWidth: 20),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cubitAddReceipt.receiptModel!.vendor!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textDarkGrayColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SpaceH(inputHeigth: 5),
                  Text(
                    cubitAddReceipt.receiptModel!.serialNumber!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textHintGrayColor,
                    ),
                  ),
                  SpaceH(inputHeigth: 5),
                  Text(
                    cubitAddReceipt.receiptModel!.dateTime!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: AppSizes.getProportionateScreenHeight(35),
                child: CustomButton(
                  text: '${cubitAddReceipt.receiptModel!.totalAmount} LE',
                  fontSize: 12.sp,
                  radius: 30,
                  buttonColor: AppColors.yellowColor,
                  fontColor: Colors.black,
                  paddingVertical: 0,
                  paddinghorizontal: 0,
                  onPress: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
