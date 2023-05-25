import 'package:dartz/dartz.dart';
import 'package:digital_recipts/core/models/pin_charts_model.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/line_charts_model.dart';

abstract class BaseDashboardRepository {
  Future<Either<Failure, LineChartsModel>> getLineChart();
  Future<Either<Failure, PinChartsModel>> getPinChart();
}
