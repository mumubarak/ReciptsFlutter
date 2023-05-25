import 'package:digital_recipts/core/router/router.dart';
import 'package:digital_recipts/core/utils/app_colors.dart';
import 'package:digital_recipts/view/recipts/presentation/widget/filter_by_date_bottom_sheet.dart';
import 'package:digital_recipts/view/recipts/presentation/widget/filter_by_vendor_bottom_sheet.dart';
import 'package:digital_recipts/view/recipts/presentation/controller/recipts_cubit.dart';
import 'package:digital_recipts/widgets/custom_button.dart';
import 'package:digital_recipts/widgets/space_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/space_height.dart';
import 'filter_by_categories_bottom_sheet.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReciptsCubit, ReciptsState>(
      buildWhen: (previous, current) =>
          previous != current ||
          current is SelectedLoaded ||
          current is ClearSelectedLoaded,
      builder: (context, state) {
        final reciptsCubit = ReciptsCubit.of(context);
        return Container(
          height: AppSizes.screenHeight * 0.42,
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
                    Text(
                      'Filter By',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: reciptsCubit.clearAllItemFromFilter,
                      child: const Text(
                        'Clear',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
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
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (BuildContext ctx) {
                              return BlocProvider.value(
                                value: reciptsCubit,
                                child: const FilterByVendorBottomSheet(),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'Vendor',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontFamily: 'lib/fonts/Roboto-Regular.ttf',
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: AppSizes.screenWidth * .62,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: ReciptsCubit.of(context)
                                            .listOfSelectedVendors
                                            .map((element) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                right: AppSizes
                                                    .getProportionateScreenHeight(
                                                        5)),
                                            child: Text(
                                              element.vendorsData.vendorName!,
                                              style: const TextStyle(
                                                fontFamily:
                                                    'lib/fonts/Roboto-Regular.ttf',
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SpaceH(inputHeigth: 5),
                      const Divider(),
                      SpaceH(inputHeigth: 5),
                      InkWell(
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
                              return BlocProvider.value(
                                value: reciptsCubit,
                                child: FilterByDateBottomSheet(),
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Date',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontFamily:
                                          'lib/fonts/Roboto-Regular.ttf'),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: AppSizes.screenWidth * .66,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          reciptsCubit.selectedStartDate,
                                          style: const TextStyle(
                                            fontFamily:
                                                'lib/fonts/Roboto-Regular.ttf',
                                          ),
                                        ),
                                        SpaceW(inputWidth: 10),
                                        reciptsCubit.selectedEndDate == ''
                                            ? const Text('')
                                            :  const Text(
                                          '-',
                                          style: TextStyle(
                                            fontFamily:
                                                'lib/fonts/Roboto-Regular.ttf',
                                          ),
                                        ),
                                        SpaceW(inputWidth: 10),
                                        Text(
                                                reciptsCubit.selectedEndDate,
                                                style: const TextStyle(
                                                  fontFamily:
                                                      'lib/fonts/Roboto-Regular.ttf',
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SpaceH(inputHeigth: 5),
                      const Divider(),
                      SpaceH(inputHeigth: 5),
                      InkWell(
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
                              return BlocProvider.value(
                                value: reciptsCubit,
                                child: const FilterByCategoriesBottomSheet(),
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Categories',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontFamily: 'lib/fonts/Roboto-Regular.ttf',
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: AppSizes.screenWidth * .55,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: ReciptsCubit.of(context)
                                            .listOfSelectedCategories
                                            .map((element) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                right: AppSizes
                                                    .getProportionateScreenHeight(
                                                        5)),
                                            child: Text(
                                              element
                                                  .categoriesData.categoryName!,
                                              style: const TextStyle(
                                                fontFamily:
                                                    'lib/fonts/Roboto-Regular.ttf',
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SpaceH(inputHeigth: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: 'Filter',
                      onPress: () {
                        reciptsCubit.listOfSelectedVendors.isEmpty &&
                                reciptsCubit.listOfSelectedCategories.isEmpty &&
                                reciptsCubit.selectedStartDate == '' &&
                                reciptsCubit.selectedEndDate == ''
                            ? reciptsCubit.getRecipts()
                            : reciptsCubit.getCustomRecipts(
                                reciptsCubit.listOfSelectedVendors.isEmpty
                                    ? ''
                                    : reciptsCubit.listOfSelectedVendors.first
                                        .vendorsData.sId!,
                                reciptsCubit.listOfSelectedCategories.isEmpty
                                    ? ''
                                    : reciptsCubit.listOfSelectedCategories
                                        .first.categoriesData.sId!,
                                reciptsCubit.selectedStartDate ?? '',
                                reciptsCubit.selectedEndDate ?? '',
                              );
                        MagicRouter.pop();
                      },
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
