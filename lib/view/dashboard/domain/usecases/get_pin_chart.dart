import 'package:dartz/dartz.dart';
import 'package:digital_recipts/core/models/line_charts_model.dart';
import 'package:digital_recipts/view/dashboard/domain/repository/base_dashboard_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/pin_charts_model.dart';

class GetPinChart{
  final BaseDashboardRepository baseDashboardRepository;
  GetPinChart(this.baseDashboardRepository);

  Future<Either<Failure, PinChartsModel>> execute() async {
    return await baseDashboardRepository.getPinChart();
  }
}