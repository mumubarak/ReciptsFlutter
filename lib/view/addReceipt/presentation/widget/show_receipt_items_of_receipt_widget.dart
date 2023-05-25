import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/space_height.dart';
import '../../../../widgets/space_width.dart';
import '../controller/add_receipt_cubit.dart';

class ShowReceiptItemsOfReceiptWidget extends StatelessWidget {
  const ShowReceiptItemsOfReceiptWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubitAddReceipt = AddReceiptCubit.of(context);
    return Container(
      width: AppSizes.screenWidth,
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
          Row(
            children: [
              Icon(
                Icons.card_travel,
                color: AppColors.primaryColor,
              ),
              SpaceW(inputWidth: 10),
              Text(
                "${cubitAddReceipt.receiptModel!.items!.length} items",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SpaceH(inputHeigth: 10),
          Container(
            width: AppSizes.screenWidth,
            height: 1,
            color: Colors.grey,
          ),
          SpaceH(inputHeigth: 10),
          Column(
            children: List.generate(
              cubitAddReceipt.receiptModel!.items!.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.getProportionateScreenHeight(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${cubitAddReceipt.receiptModel!.items![index].quantity!}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDarkGrayColor,
                          ),
                        ),
                        SpaceW(inputWidth: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cubitAddReceipt.receiptModel!.items![index].item!,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textDarkGrayColor,
                              ),
                            ),
                            Text(
                              '#755151615',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textHintGrayColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.getProportionateScreenHeight(35),
                      width: AppSizes.getProportionateScreenWidth(70),
                      child: CustomButton(
                        text:
                            "${cubitAddReceipt.receiptModel!.items![index].finalPrice!} LE",
                        fontSize: 12.sp,
                        radius: 30,
                        buttonColor: AppColors.grayColor2,
                        fontColor: AppColors.primaryColor,
                        paddingVertical: 0,
                        paddinghorizontal: 0,
                        onPress: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
