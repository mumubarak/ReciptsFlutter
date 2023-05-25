import 'package:digital_recipts/core/models/recipts_model.dart';
import 'package:digital_recipts/view/recipts/presentation/controller/recipts_cubit.dart';
import 'package:digital_recipts/widgets/loading_indicator.dart';
import 'package:digital_recipts/widgets/recipt_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/space_height.dart';

class ListOfReciptsWidget extends StatelessWidget {
  ListOfReciptsWidget({Key? key}) : super(key: key);

  List<ReciptsData> listOfRecipts = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReciptsCubit, ReciptsState>(
      buildWhen: (previous, current) =>
          previous != current ||
          current is GetCustomReciptsLoaded ||
          current is GetReciptsLoaded,
      builder: (context, state) {
        final cubit = ReciptsCubit.of(context);
        if (state is GetReciptsLoaded) {
          listOfRecipts.clear();
          listOfRecipts.addAll(state.listOfRecipts);
        } else if (state is GetCustomReciptsLoaded) {
          listOfRecipts.clear();
          listOfRecipts.addAll(state.listOfRecipts);
        } else if (state is GetReciptsLoading ||
            state is GetCustomReciptsLoading) {
          return const Expanded(child: LoadingIndicator());
        }
        return Expanded(
          child: SingleChildScrollView(
            child: listOfRecipts.isEmpty
                ? const Text('No Item')
                : Column(
                    children: List.generate(
                      listOfRecipts.length,
                      (index) => Column(
                        children: [
                          InkWell(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    AppSizes.getProportionateScreenWidth(15),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(233, 234, 235, 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppSizes.getProportionateScreenWidth(10),
                                  vertical:
                                      AppSizes.getProportionateScreenHeight(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cubit.formatDate(
                                              // DateFormat.MMMM('en_US'),
                                              DateFormat('MMMM y'),
                                              listOfRecipts[index].dateTime ??
                                                  '') ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          AppSizes.getProportionateScreenHeight(
                                              35),
                                      child: CustomButton(
                                        text:
                                            '${listOfRecipts[index].totalAmount.toString() ?? '0'}LE',
                                        radius: 30,
                                        buttonColor: AppColors.yellowColor,
                                        fontColor:
                                            const Color.fromRGBO(74, 74, 74, 1),
                                        borderColor: AppColors.yellowColor,
                                        paddingVertical: 0,
                                        paddinghorizontal: 15,
                                        onPress: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SpaceH(inputHeigth: 12),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    AppSizes.getProportionateScreenWidth(10)),
                            child: Column(
                              children: List.generate(
                                listOfRecipts[index].reciptItem!.length,
                                (subIndex) => ReciptCard(
                                  date: cubit.formatDate(
                                      DateFormat.yMMMd('en_US'),
                                      listOfRecipts[index].dateTime ?? ''),
                                  reciptItem: listOfRecipts[index]
                                      .reciptItem![subIndex],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
