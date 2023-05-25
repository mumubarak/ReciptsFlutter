import 'package:digital_recipts/core/utils/app_colors.dart';
import 'package:digital_recipts/view/recipts/presentation/controller/recipts_cubit.dart';
import 'package:digital_recipts/widgets/custom_button.dart';
import 'package:digital_recipts/widgets/space_height.dart';
import 'package:digital_recipts/widgets/space_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_sizes.dart';

class FilterByDateBottomSheet extends StatelessWidget {
  FilterByDateBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ReciptsCubit.of(context);
    return BlocBuilder<ReciptsCubit, ReciptsState>(
      buildWhen: (previous, current) =>
      previous != current || current is ClearSelectedLoaded,
      builder: (context, state) {
        return Container(
          height: AppSizes.screenHeight * 0.4,
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
              horizontal: AppSizes.getProportionateScreenWidth(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 20.sp,
                          ),
                          onPressed: () {
                            MagicRouter.pop();
                          },
                        ),
                        Text(
                          'Date',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: cubit.clearDateFromFilter,
                      child: const Text(
                        'Clear',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SpaceH(inputHeigth: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        text: cubit.selectedStartDate.isEmpty
                            ? 'From'
                            : cubit.selectedStartDate,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.normal,
                        buttonColor: Colors.white,
                        borderColor: AppColors.primaryColor,
                        paddingVertical: 12,
                        radius: 5,
                        onPress: () async {
                          cubit.selectedStartDate =
                              await cubit.selectDate(context);
                        },
                      ),
                    ),
                    SpaceW(inputWidth: 10),
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        text: cubit.selectedEndDate.isEmpty
                            ? 'To'
                            : cubit.selectedEndDate,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.normal,
                        buttonColor: Colors.white,
                        borderColor: AppColors.primaryColor,
                        paddingVertical: 12,
                        radius: 5,
                        onPress: () async {
                          cubit.selectedEndDate =
                              await cubit.selectDate(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
