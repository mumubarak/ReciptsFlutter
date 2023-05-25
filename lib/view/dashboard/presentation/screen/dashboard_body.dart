import 'package:digital_recipts/core/utils/app_enums.dart';
import 'package:digital_recipts/view/dashboard/presentation/widget/pie_chart_widget.dart';
import 'package:digital_recipts/view/dashboard/presentation/widget/report_dashboard_widget.dart';
import 'package:digital_recipts/view/dashboard/presentation/widget/tab_buttons_for_charts_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/space_height.dart';
import '../controller/dashboard_cubit.dart';
import '../widget/date_for_charts_widget.dart';
import '../widget/line_chart_widget.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        final cubitDashboard = DashboardCubit.of(context);
        return Column(
          children: [
            SpaceH(inputHeigth: 15),
            TabButtonsForChartsWidget(),
            SpaceH(inputHeigth: 15),
            DateForChartsWidget(),
            SpaceH(inputHeigth: 15),
            cubitDashboard.chart == Charts.pin
                ? PieChartWidget()
                : cubitDashboard.chart == Charts.line
                    ? LineChartWidget()
                    : cubitDashboard.chart == Charts.report
                        ? ReportDashboardWidget()
                        : PieChartWidget(),
          ],
        );
      },
    );
  }
}
