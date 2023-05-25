import 'package:digital_recipts/core/router/router.dart';
import 'package:digital_recipts/core/utils/app_colors.dart';
import 'package:digital_recipts/core/utils/app_sizes.dart';
import 'package:digital_recipts/view/reciptDetails/presentation/controller/recipt_details_cubit.dart';
import 'package:digital_recipts/view/reciptDetails/presentation/widget/recipt_details_payment_methed_widget.dart';
import 'package:digital_recipts/widgets/loading_indicator.dart';
import 'package:digital_recipts/widgets/space_height.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/services_locator.dart';
import '../widget/recipt_details_card.dart';
import '../widget/recipt_details_items_of_receipt_widget.dart';
import '../widget/recipt_details_tax_of_receipt_widget.dart';

class ReciptDetailsScreen extends StatelessWidget {
  ReciptDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReciptDetailsCubit(sl())..getReciptDetails('63eeab2a5749fcef9fd6b24b'),
      child: BlocBuilder<ReciptDetailsCubit, ReciptDetailsState>(
        builder: (context, state) {
          final cubit = ReciptDetailsCubit.of(context);
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recipt Details',
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
                    state is GetReciptDetailsLoading
                        ? LoadingIndicator()
                        : Column(
                            children: [
                              ReciptDetailsCard(),
                              SpaceH(inputHeigth: 10),
                              ReciptDetailsItemsOfReceiptWidget(),
                              SpaceH(inputHeigth: 10),
                              ReciptDetailsTaxOfReceiptWidget(),
                              SpaceH(inputHeigth: 10),
                              ReciptDetailsPaymentMethedWidget(),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
