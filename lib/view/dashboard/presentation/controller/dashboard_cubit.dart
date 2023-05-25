import 'package:bloc/bloc.dart';
import 'package:digital_recipts/core/models/pin_charts_model.dart';
import 'package:digital_recipts/view/dashboard/domain/usecases/get_line_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/line_charts_model.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../widgets/snackBar.dart';
import '../../domain/usecases/get_pin_chart.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this.getLineChartUseCase, this.getPinChartUseCase)
      : super(DashboardInitial());

  static DashboardCubit of(context) => BlocProvider.of(context);
  final GetLineChart getLineChartUseCase;
  final GetPinChart getPinChartUseCase;

  LineChartsModel? lineChartModel;
  PinChartsModel? pinChartModel;

  Charts chart = Charts.pin;

  void changeTabButtons(String tab) {
    if (tab == 'pin') {
      chart = Charts.pin;
    } else if (tab == 'line') {
      chart = Charts.line;
    } else if (tab == 'report') {
      chart = Charts.report;
    }
    emit(ChangeTabButtonsState());
  }

  Future getLineChart() async {
    emit(GetLineChartLoading());
    final res = await getLineChartUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(DashboardInitial());
      },
      (res) async {
        lineChartModel = res;
        emit(DashboardInitial());
      },
    );
  }

  Future getPinChart() async {
    emit(GetPinChartLoading());
    final res = await getPinChartUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(DashboardInitial());
      },
      (res) async {
        pinChartModel = res;
        emit(DashboardInitial());
      },
    );
  }
}
