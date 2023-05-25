import 'package:dartz/dartz.dart';
import 'package:digital_recipts/core/models/line_charts_model.dart';
import 'package:digital_recipts/view/dashboard/domain/repository/base_dashboard_repository.dart';

import '../../../../core/error/failure.dart';

class GetLineChart{
  final BaseDashboardRepository baseDashboardRepository;
  GetLineChart(this.baseDashboardRepository);

  Future<Either<Failure, LineChartsModel>> execute() async {
    return await baseDashboardRepository.getLineChart();
  }
}