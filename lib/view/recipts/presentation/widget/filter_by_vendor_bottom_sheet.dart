import 'package:digital_recipts/core/utils/app_colors.dart';
import 'package:digital_recipts/view/recipts/presentation/controller/recipts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_sizes.dart';

class FilterByVendorBottomSheet extends StatelessWidget {
  const FilterByVendorBottomSheet({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
      final reciptsCubit = ReciptsCubit.of(context);
      return BlocBuilder<ReciptsCubit, ReciptsState>(
        buildWhen: (previous, current) =>
        previous != current || current is ClearSelectedLoaded,
        builder: (context, state) {
          return Container(
            height: AppSizes.screenHeight * 0.6,
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
                            'Vendors',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('(${reciptsCubit.listOfSelectedVendors.length})'),
                          TextButton(
                            onPressed: reciptsCubit.clearVendorItemsFromFilter,
                            child: const Text(
                              'Clear',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.getProportionateScreenWidth(10),
                        vertical: AppSizes.getProportionateScreenHeight(15),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.separated(
                        itemCount: reciptsCubit.listOfVendors.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => reciptsCubit.selectVendors(index),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                AppSizes.getProportionateScreenWidth(10),
                                vertical:
                                AppSizes.getProportionateScreenHeight(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    reciptsCubit.listOfVendors[index].vendorsData
                                        .vendorName ??
                                        '',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontFamily: 'lib/fonts/Roboto-Regular.ttf',
                                    ),
                                  ),
                                  reciptsCubit.listOfVendors[index].isSelected
                                      ? const Icon(
                                    Icons.check,
                                    color: AppColors.primaryColor,
                                  )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          );
                        },
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