import 'package:digital_recipts/core/models/pin_charts_model.dart';
import 'package:digital_recipts/core/utils/app_sizes.dart';
import 'package:digital_recipts/view/dashboard/presentation/controller/dashboard_cubit.dart';
import 'package:digital_recipts/widgets/loading_indicator.dart';
import 'package:digital_recipts/widgets/space_height.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/services/services_locator.dart';
import 'item_of_chart_widget.dart';

class PieChartWidget extends StatefulWidget {
  PieChartWidget({Key? key}) : super(key: key);

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int? _clickedIndex;

  List<PieChartSectionData> pieChartSections(List<PieChartsData> pieChartData) {
    return List.generate(pieChartData.length, (index) {
      final bool isClicked = index == _clickedIndex;
      final double fontSize = isClicked ? 16 : 10;
      final double radius = isClicked ? 50 : 40;

      return PieChartSectionData(
        color: HexColor('#232985'),
        value: pieChartData[index].value!.toDouble(),
        title: pieChartData[index].title,
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(sl(), sl())..getPinChart(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          final cubit = DashboardCubit.of(context);
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.getProportionateScreenWidth(15),
              ),
              child: Column(
                children: [
                  state is GetPinChartLoading ? const LoadingIndicator() : Container(
                    padding: EdgeInsets.all(
                      AppSizes.getProportionateScreenHeight(20),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: AppSizes.getProportionateScreenHeight(210),
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                  touchCallback: (flTouchEvent, touchResponse) {
                                // setState(() {
                                //   if (touchResponse!.touchedSection
                                //           is FlLongPressEnd ||
                                //       touchResponse.touchedSection
                                //           is FlPanEndEvent) {
                                //     _clickedIndex = -1;
                                //   } else {
                                //     _clickedIndex = touchResponse
                                //         .touchedSection!.touchedSectionIndex;
                                //   }
                                // });
                              }),
                              borderData: FlBorderData(show: true),
                              sectionsSpace: 10.sp,
                              centerSpaceRadius: 60.sp,
                              sections: pieChartSections(cubit.pinChartModel!.pieChart!.pieChartData!),
                            ),
                          ),
                        ),
                        Container(
                          height: AppSizes.getProportionateScreenHeight(210),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Cost',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '5000 LE',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SpaceH(inputHeigth: 20),
                              Text(
                                'No of receipts',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '23',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.getProportionateScreenHeight(15),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.getProportionateScreenHeight(10),
                          horizontal: AppSizes.getProportionateScreenWidth(15),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: ListView.separated(
                          itemCount: 10,
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) {
                            return ItemOfChartWidget();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
