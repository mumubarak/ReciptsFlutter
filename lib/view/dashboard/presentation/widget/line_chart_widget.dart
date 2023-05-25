import 'package:digital_recipts/core/models/line_charts_model.dart';
import 'package:digital_recipts/core/utils/app_sizes.dart';
import 'package:digital_recipts/widgets/space_width.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../widgets/loading_indicator.dart';
import '../controller/dashboard_cubit.dart';
import 'item_of_chart_widget.dart';

class PricePoint {
  final int x;
  final int y;
  final Color color;

  PricePoint(this.x, this.y, this.color);
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  List<BarChartGroupData> _chartGroups(List<LineChartsData> lineChartData) {
    return lineChartData
        .map(
          (point) => BarChartGroupData(
            x: point.x!,
            barRods: [
              BarChartRodData(
                toY: point.y!.toDouble(),
                color: Colors.red,
                width: AppSizes.getProportionateScreenWidth(15),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              )
            ],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(sl(), sl())..getLineChart(),
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
                  state is GetLineChartLoading
                      ? const LoadingIndicator()
                      : Container(
                          height: AppSizes.getProportionateScreenHeight(250),
                          padding: EdgeInsets.all(
                            AppSizes.getProportionateScreenHeight(20),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height:
                                    AppSizes.getProportionateScreenHeight(170),
                                child: BarChart(
                                  BarChartData(
                                    barGroups: _chartGroups(cubit
                                        .lineChartModel!
                                        .lineCharts!
                                        .lineChartData!),
                                    borderData: FlBorderData(
                                        border:
                                            const Border(bottom: BorderSide())),
                                    gridData: FlGridData(show: true),
                                    titlesData: FlTitlesData(
                                      bottomTitles: AxisTitles(
                                          sideTitles:
                                              SideTitles(showTitles: false)),
                                      leftTitles: AxisTitles(
                                          sideTitles:
                                              SideTitles(showTitles: false)),
                                      topTitles: AxisTitles(
                                          sideTitles:
                                              SideTitles(showTitles: false)),
                                      rightTitles: AxisTitles(
                                          sideTitles:
                                              SideTitles(showTitles: false)),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Total Cost',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SpaceW(inputWidth: 5),
                                      Text(
                                        '5000 LE',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'No of receipts',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SpaceW(inputWidth: 5),
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
                                ],
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
                          separatorBuilder: (context, index) => const Divider(),
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
