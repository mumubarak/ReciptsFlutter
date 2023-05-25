import 'package:digital_recipts/core/router/router.dart';
import 'package:digital_recipts/core/utils/app_colors.dart';
import 'package:digital_recipts/core/utils/app_sizes.dart';
import 'package:digital_recipts/widgets/custom_button.dart';
import 'package:digital_recipts/widgets/space_height.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/add_receipt_cubit.dart';
import '../widget/show_receipt_details_card.dart';
import '../widget/show_receipt_items_of_receipt_widget.dart';
import '../widget/show_receipt_payment_methed_widget.dart';
import '../widget/show_receipt_tax_of_receipt_widget.dart';

class ShowReceiptScreen extends StatelessWidget {
  const ShowReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubitAddReceipt = AddReceiptCubit.of(context);
    return Container(
      height: AppSizes.screenHeight * 0.9,
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Receipt Details',
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.black,
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
                  ShowReceiptDetailsCard(),
                  SpaceH(inputHeigth: 10),
                  ShowReceiptItemsOfReceiptWidget(),
                  SpaceH(inputHeigth: 10),
                  ShowReceiptTaxOfReceiptWidget(),
                  SpaceH(inputHeigth: 10),
                  ShowReceiptPaymentMethedWidget(),
                ],
              ),
            ),
            SpaceH(inputHeigth: 20),
            CustomButton(
              text: 'Save',
              onPress: cubitAddReceipt.addReceipt,
            ),
          ],
        ),
      ),
    );
  }
}
